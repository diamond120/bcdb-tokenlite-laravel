<?php

namespace App\BigChainDB;

use Illuminate\Support\ServiceProvider;
use GuzzleHttp\Client;

class BigChainServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(Client::class, function ($app) {
            return new Client([
                'base_uri' => config('bigchaindb.driver'),
                'headers' => config('bigchaindb.headers'),
            ]);
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
