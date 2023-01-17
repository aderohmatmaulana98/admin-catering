<?php

namespace App\Http\Controllers;

use App\Models\Pemesanan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;

class PemesananController extends Controller
{
    public function index()
    {
        return Pemesanan::all();
    }

    public function create(Request $request)
    {
        $data = $request->only(
            'idUser',
            'idPaket',
            'idStatusPemesanan'
        );

        $validator = Validator::make($data,[
            'idUser' => 'required|int',
            'idPaket' => 'required|int',
            'idStatusPemesanan' => 'required|int'
        ]);

        if($validator->fails()) {
            return response()->json([
                'status' => 'failed',
                'message' => $validator->messages()
            ]);
        }


        $pemesanan = Pemesanan::create([
            'id_user' => $request->idUser,
            'id_paket' => $request->idPaket,
            'id_status_pemesanan' => $request->idStatusPemesanan
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'pemesanan created',
            'data' => $pemesanan
        ], Response::HTTP_OK);
    }
    
    public function update(Request $request, $id)
    {
        $data = $request->only(
            'idUser',
            'idPaket',
            'idStatusPemesanan'
        );

        $pemesanan = Pemesanan::findOrFail($id);
        $pemesanan->update($request->all());

        return response()->json([
            'status' => 'success',
            'message' => 'pemesanan updated',
            'data' => $request->all()
        ], Response::HTTP_OK);
    }

    public function delete($id)
    {
        Pemesanan::findOrFail($id)->delete();
        return response()->json([
            'status' => 'success',
            'message' => "pemesanan with id $id deleted",
        ], Response::HTTP_OK);
    }
}
