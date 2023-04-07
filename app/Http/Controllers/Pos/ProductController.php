<?php

namespace App\Http\Controllers\Pos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Supplier;
use App\Models\Unit;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;

class ProductController extends Controller
{
    public function ProductAll()
    {
        $product = Product::latest()->get();
        return view('backend.product.product_all', compact('product'));
    } // End Method

    public function ProductAdd()
    {
        $supplier = Supplier::all();
        $category = Category::all();
        $unit = Unit::all();
        return view('backend.product.product_add', compact('supplier', 'category', 'unit'));
    } // End Method

    public function ProductStore(Request $request)
    {
        Product::insert([
            'name' => $request->name,
            'supplier_id' => $request->supplier_id,
            'unit_id' => $request->unit_id,
            'category_id' => $request->category_id,
            'quantity' => $request->quantity,
            'created_by' => Auth::user()->id,
            'created_at' => Carbon::now(),
        ]);
        $notification = [
            'message' => 'Thêm sản phẩm thành công',
            'alert-type' => 'success',
        ];
        return redirect()
            ->route('product.all')
            ->with($notification);
    } // End Method

    public function ProductEdit($id)
    {
        $supplier = Supplier::all();
        $category = Category::all();
        $unit = Unit::all();
        $product = Product::findOrFail($id);
        return view('backend.product.product_edit', compact('product', 'supplier', 'category', 'unit'));
    } // End Method

    public function ProductUpdate(Request $request)
    {
        $product_id = $request->id;
        Product::findOrFail($product_id)->update([
            'name' => $request->name,
            'supplier_id' => $request->supplier_id,
            'unit_id' => $request->unit_id,
            'category_id' => $request->category_id,
            'quantity'=> $request->quantity,
            'updated_by' => Auth::user()->id,
            'updated_at' => Carbon::now(),
        ]);
        $notification = [
            'message' => 'Cập nhật thông tin sản phẩm thành công',
            'alert-type' => 'success',
        ];
        return redirect()
            ->route('product.all')
            ->with($notification);
    } // End Method
    public function ProductDelete($id)
    {
        Product::findOrFail($id)->delete();
        $notification = [
            'message' => 'Xóa sản phẩm thành công',
            'alert-type' => 'success',
        ];
        return redirect()
            ->back()
            ->with($notification);
    } // End Method
}
