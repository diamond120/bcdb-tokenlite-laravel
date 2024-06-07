<?php
/**
 * BigChain Collection : 
 *
 */
namespace App\BigChainDB;

class BigChainQuery
{
    protected $table = "";

    public function __construct(String $table)
    {
        $this->table = $table;
    }

    public function where($key, $value)
    {
        return $this;
    }

    public function first()
    {
        $obj = new \stdClass();
        $obj->object = $this->table;
        $obj->save_activity = 'TRUE';
        return $obj;
    }
}