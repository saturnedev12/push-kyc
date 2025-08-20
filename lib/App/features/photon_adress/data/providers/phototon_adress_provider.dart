import 'package:dio/dio.dart';
import 'package:push_kyc/app/features/photon_adress/data/models/photon_address_collection.dart';
import 'package:retrofit/retrofit.dart';

part 'phototon_adress_provider.g.dart';

@RestApi(baseUrl: 'https://photon.komoot.io')
abstract class PhototonAdressProvider {
  factory PhototonAdressProvider(Dio dio, {String baseUrl}) =
      _PhototonAdressProvider;

  // Forward search endpoint: /api
  // Docs show: q, lang, limit, lon, lat, bbox, layer, dedupe, zoom, location_bias_scale
  @GET('/api')
  Future<PhotonAddressCollection> search(
    @Query('q') String query, {
    @Query('lang') String? lang,
    @Query('limit') int? limit,
    @Query('lon') double? lon,
    @Query('lat') double? lat,
    @Query('layer') List<String>? layer, // e.g., ['city','street']
    // @Query('dedupe') int? dedupe,
  });

  // @PATCH('/product/{id}')
  // @MultiPart()
  // Future<ProductModel> updateProduct({
  //   @Path("id") required String id,
  //   @Part(name: "name") String? name,
  //   @Part(name: "description") String? description,
  //   @Part(name: "price") int? price,
  //   @Part(name: "files") List<File>? files,
  // });

  // @GET('/product/mines')
  // Future<ProdtuctCollection> getProducts({
  //   @Query("page") int page = 1,
  //   @Query("limit") int limit = 10,
  //   @Query("orderBy") String orderBy = "createdAt",
  //   @Query("order") String order = "ASC",
  //   @Query("where") String? where, // Doit être encodé en JSON
  //   @Query("search") String? search,
  // });

  // @DELETE('/product/{id}')
  // Future<HttpResponse> deleteProduct(@Path() String id);

  // @DELETE('/product/{id}/images/{imageId}')
  // Future<ProductModel> deleteProductImage(
  //   @Path('id') String id,
  //   @Path('imageId') String idImage,
  // );
}
