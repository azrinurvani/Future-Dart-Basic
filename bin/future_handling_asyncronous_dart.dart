import 'package:future_handling_asyncronous_dart/future_handling_asyncronous_dart.dart' as future_handling_asyncronous_dart;

void main(List<String> arguments) async { ////fungsi main diubah dari synchronous menjadi asynchronous
  // final myFuture = Future((){
  //   print('Creating the future');
  //   return 12;
  // });
  // print('main() done');

  //Jika kode di atas dijalankan, seluruh fungsi main akan dieksekusi sebelum fungsi yang ada di dalam Future().
  // Ini disebabkan karena future masih berstatus uncompleted.

  /*
  * IMPLEMENTASI FUTURE tanpa ASYNC pada method main
  * */
  // getOrder().then((value) {
  //   print('Your ordered: $value'); //Fungsi getOrder() akan dijalankan secara asynchronous hingga setelah 3 detik kode
  // })
  // .catchError((error){
  //   print('Sorry. $error');
  // })
  // .whenComplete(() {
  //   print('Thank you');
  // });
  // print('Getting your order...');

  /*
  * IMPLEMENTASI FUTURE menggunakan ASYNC pada method main
  * */

  print('Getting your order...');
  try{
    var order = await getOrder(); //Uncompleted
    print('Your order : $order'); // Completed with data
  }catch(error){
    print('Sorry. $error'); // Completed with error
  }finally{
    print('Thank you'); // When complete
  }

}

Future<String>getOrder(){
  return Future.delayed(Duration(seconds: 3),(){
    return 'Coffe Boba';
  });
}

// Future<String> getOrder(){ //testing untuk mendapatkan error
//   return Future.delayed(Duration(seconds: 3),(){
//     var isStockAvailable = false;
//     if(isStockAvailable){
//       return 'Coffe Boba';
//     }else{
//       throw 'Our stock is not enough';
//     }
//   });
// }

/*
* NOTE
* 1. Fungsi getOrder() yang berisi Future yang masih uncompleted.
* 2. Method then() yang menangani kondisi completed with data.
* 3. Method catchError() yang menangani kondisi completed with error.
* 4. Untuk merubah proses menjadi asynchronous mesti menggunakan kata kunci async pada method main (tempat method getOrder di implementasikan)
* dan untuk pembuatan object agar mendapatkan nilai dari getOrder() mesti menambahkan kata kunci 'await'
* */