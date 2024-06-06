<?php
/**
 * BigChain Model : Base Class
 *
 */
namespace App\BigChainDB;

class BigChainModel
{
    /*
     * Table Name Specified
     */
    protected $table;

    public static function where($operand)
    {
        return BigChainQuery::create([
            "operator" => "is",
            "operand" => $operand
        ]);
    }
}