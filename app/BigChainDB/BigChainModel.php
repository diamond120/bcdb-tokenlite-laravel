<?php
/**
 * BigChain Model : Base Class
 *
 */
namespace App\BigChainDB;

class BigChainModel
{
    protected static $table;

    public static function __callStatic($method, $parameters)
    {
        $query = new BigChainQuery(static::$table);
        if(method_exists($query, $method))
            return call_user_func_array([$query, $method], $parameters);
        return (new static)->$method(...$parameters);
    }
}