<?php

namespace App\Http\Controllers;
use App\Models\Trip;
use App\Models\seat_allocation;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function insert(Request $req){

        $trip = new Trip();
        $trip->name = $req->name;
        $trip->mobile= $req->mobile;
        $trip->from= $req->from;
        $trip->to= $req->to;
        $trip->date= $req->date;
        $trip->save();

        $seat_allocation=seat_allocation::find(1);
        $seat_allocation->seats=json_encode($req->alloc);
        $seat_allocation->save();

        return redirect()->back()->with('success','Your seat has been reserved successfully');

    }

    public function get_allocate(){
        $allocate=seat_allocation::where('id',1)->first()->seats;

        return json_decode($allocate);
    }
}
