import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  final List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  final Map<String, int> cart = {}; // 장바구니
  int totalPrice = 0;

  // 상품 목록 출력
  void showProducts() {
    print('\n[1] 상품 목록 보기');
    print('판매 중인 상품 목록:');
    for (var p in products) {
      print('${p.name} / ${p.price}원');
    }
  }

  // 장바구니에 상품 추가
  void addToCart(String productName, int quantity) {
    Product? product = products.firstWhere(
      (p) => p.name == productName,
      orElse: () => Product('', 0),
    );

    if (product.name.isEmpty) {
      print("입력값이 올바르지 않아요!");
      return;
    }

    if (quantity <= 0) {
      print("0개보다 많은 개수의 상품만 담을 수 있어요!");
      return;
    }

    cart[productName] = (cart[productName] ?? 0) + quantity;
    totalPrice += product.price * quantity;
    print("장바구니에 상품이 담겼어요!");
  }

  // 장바구니 총 가격 출력
  void showTotal() {
    print("\n[3] 장바구니에 담긴 상품의 총 가격 보기");
    print("장바구니에 담긴 상품 총 가격: ${totalPrice}원");
  }

  // 프로그램 종료
  void exitProgram() {
    print("\n[4] 프로그램 종료");
    print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();

  // 메뉴 출력
  while (true) {
    print('\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        print('장바구니에 담을 상품 이름을 입력하세요: ');
        String? productName = stdin.readLineSync();
        print('상품 개수를 입력하세요: ');
        String? quantityInput = stdin.readLineSync();
        int quantity = int.tryParse(quantityInput ?? '') ?? 0;
        mall.addToCart(productName ?? '', quantity);
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        mall.exitProgram();
        return;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요 ..');
        break;
    }
  }
}
