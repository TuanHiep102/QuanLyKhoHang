<?php

namespace App\Http\Controllers\Pos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Supplier;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;

class SupplierController extends Controller
{
    public function SupplierAll(){
        $suppliers = Supplier::all();
        //$suppliers = Supplier::latest()->get();
        return view('backend.supplier.supplier_all',compact('suppliers'));
    }

    public function SupplierAdd(){
        return view('backend.supplier.supplier_add');
    }

    public function SupplierStore(Request $request){
        Supplier::insert([
            'name' => $request->name,
            'mobile_no' => $request->mobile_no,
            'email' => $request->email,
            'address' => $request->address,
            'create_by' => Auth::user()->id,
            'create_at' => Carbon::now(),
        ]);
        $notification = array(
            'message' => 'Đã thêm mới nhà cung cấp thành công',
            'alert-type' => 'success',
        );
        return redirect()->route('supplier.all')->with($notification);
    }
}
