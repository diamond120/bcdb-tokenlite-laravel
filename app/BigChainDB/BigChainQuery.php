<?php
/**
 * BigChain Collection : 
 *
 */
namespace App\BigChainDB;

class BigChainQuery
{
    private $queries = [];

    public static function create($query) {
        $obj = new self();
        $obj->queries->push($query);
        return $obj;
    }
}