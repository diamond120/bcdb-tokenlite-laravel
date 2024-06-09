<?php
/**
 * BigChain Collection : 
 *
 */
namespace App\BigChainDB;

use GuzzleHttp\Client;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Log;

class BigChainQuery
{
    protected $table;
    protected $object;
    protected $queries = null;
    protected $orders = [];
    protected $limit = null;
    protected static $driver = null;
    
    public function __construct(string $table = null, string $object = null)
    {
        $this->table = $table;
        $this->object = $object;
        if(!self::$driver) {
            self::$driver = new Client([
                'base_uri' => config('bigchaindb.driver'),
                'headers' => config('bigchaindb.headers')
            ]);
        }
    }

    private function getParams() {
        return [
            'object' => $this->table,
            'where' => $this->queries,
            'orderBy' => $this->orders,
            'limit' => $this->limit
        ];
    }
    
    public function all()
    {
        $res = self::$driver->get('/', [ 'query' => [ 'object' => $this->table ]]);
        $items = json_decode($res->getBody()->getContents())->data;
        return array_map(function($item) { return new $this->object($item); }, $items);
    }

    public function get()
    {        
        if($this->table == 'ico_stages' || $this->table == 'transactions') {
            $this->queries = [];
        }

        if(!$this->table) {
            throw new \Exception('sfdsfas');
        }
        $res = self::$driver->get('/', [ 'query' => $this->getParams() ]);
        
        $items = json_decode($res->getBody()->getContents())->data;
        if(!is_array($items)) {
            throw new \Exception(json_encode($items));
        }
        return new Collection(array_map(function($item) { return new $this->object($item); }, $items));
    }

    public function first()
    {
        $this->limit(1);
        $res = $this->get();
        return empty($res) ? null : $res[0];
    }

    public function count()
    {
        $res = self::$driver->get('/count', [ 'query' => $this->getParams() ]);
        return json_decode($res->getBody()->getContents())->data;
    }

    public function sum($column)
    {
        $params = $this->getParams();
        $params['column'] = $column;
        $res = self::$driver->get('/sum', [ 'query' => $params ]);
        return json_decode($res->getBody()->getContents())->data;
    }

    public function create($data)
    {
        $res = self::$driver->post('/', [ 'json' => [
            'data' => $data,
            'object' => $this->table
        ]]);
        $sss = $this->where($data)->first();
        Log::info("Created " . json_encode($sss));
        return $sss;
        //Log::info("Create" . json_encode(json_decode($res->getBody()->getContents())));
    }

    public function insert($data)
    {
        return $this->create($data);
    }

    public function update($data)
    {
        $params = $this->getParams();
        $params['data'] = $data;
        $res = self::$driver->put('/', [ 'json' => $params ]);
        Log::info("Update" . json_encode(json_decode($res->getBody()->getContents())));
    }

    public function delete()
    {
        $res = self::$driver->delete('/', [ 'query' => $this->getParams() ]);
        Log::info("Delete" . json_encode(json_decode($res->getBody()->getContents())));
    }
   
    /**
     * Add LIMIT clause to the query.
     * @param  int   $column
     * @return $this
     */
    public function limit($count)
    {
        $this->limit = $count;
        return $this;
    }

    /**
     * Add ORDER BY clause to the query.
     *
     * @param  string  $column
     * @param  string  $order
     * @return $this
     */
    public function orderBy($column, $order)
    {
        $this->orders[] = [ $column => $order ];
        return $this;
    }

    public function latest()
    {
        $this->orders[] = [ 'created_at' => 'DESC' ];
        return $this;
    }

    /**
     * Add WHERE clause to the query.
     *
     * @param  string  $connector
     * @param  string|array|\Closure  $column
     * @param  mixed   $operator
     * @param  mixed   $value
     * @return $this
     */
    private function addQuery($connector, $column, $operator, $value)
    {
        // Build Query
        if($value) {
            $query = [
                'operator' => strtolower($operator),
                'operand' => [
                    $column => $value
                ]
            ];
        } else if($operator) {
            $query = [
                'operator' => '==',
                'operand' => [
                    $column => $operator
                ]
            ];
        } else if($column instanceof \Closure) {
            throw new \Exception('invalid second parameter as a function');
        } else {
            $query = [
                'operator' => '==',
                'operand' => $column
            ];
        }
        // Combine Query
        if(!$this->queries) {
            $this->queries = $query;
        } else if(($this->queries['connector'] ?? null) === $connector) {
            $this->queries['queries'][] = $query;
        } else {
            $this->queries = [
                'connector' => $connector,
                'queries' => [
                    $this->queries,
                    $query
                ]
            ];
        }
        // Return Object
        return $this;
    }

    public function where($column, $operator = null, $value = null)
    {
        return $this->addQuery('and', $column, $operator, $value);
    }

    public function whereIn($column, $value) {
        return $this->where($column, 'in', $value);
    }

    public function whereNotIn($column, $value) {
        return $this->where($column, '!in', $value);
    }

    public function whereBetween($column, $value) {
        return $this->where($column, 'between', $value);
    }
    public function orWhere($column, $operator = null, $value = null)
    {
        return $this->addQuery('or', $column, $operator, $value);
    }
    
    public function orWhereIn($column, $value) {
        return $this->orWhere($column, 'in', $value);
    }

    public function orWhereNotIn($column, $value) {
        return $this->orWhere($column, '!in', $value);
    }

    public function orWhereBetween($column, $value) {
        return $this->orWhere($column, 'between', $value);
    }
}