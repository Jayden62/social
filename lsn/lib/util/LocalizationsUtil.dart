import 'package:flutter/material.dart';

class LocalizationsUtil {
  LocalizationsUtil(this.locale);

  final Locale locale;

  /// Call in screen to use.
  static LocalizationsUtil of(BuildContext context) {
    return Localizations.of<LocalizationsUtil>(context, LocalizationsUtil);
  }

  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      "ok": "Ok",
      "cancel": "Cancel",
      "close": "Close",
      "please_waiting": "Please, watting...",
      "input_empty": "Input empty !",
      "personal_information": "Personal Information",
      "save": "Save",
      "full_name": "Full name",
      "phone": "Phone number",
      "cart": "Cart",
      "store_name": "Store name",
      "profile": "Profile",
      "ancillary_information": "Ancillary information",
      "update_detailed": "Update detailed personal information",
      "shipping_address": "Shipping Address",
      "update_shipping_address": "Update shipping address",
      "order_management": "Order management",
      "favorite_product": "Favorite product",
      "favorite_product_list": "Favorite product list",
      "logout": "Log Out",
      "search": "Search",
      "search_product": "Search product",
      "see_all": "View all",
      "order": "Order",
      "reward": "Reward",
      "hot_deal": "Hot deal",
      "personal": "Personal",
      "all": "All",
      "mine": "Mine",
      "no_available_data": "No available data !",
      "load_complete": "Load complete",
      "survey": "Survey",
      "next": "Next",
      "back": "Back",
      "complete": "Complete",
      "select": "Select",
      "camera": "Camera",
      "gallery": "Gallery",
      "detail": "Detail",
      "agree_survey": "Agree to register for this survey",
      "register": "Register",
      "confirm_logout": "Confirm log out ?",
      "update_profile": "Update Profile",
      "city_province": "City / Province",
      "district": "District",
      "ward": "Ward",
      "in_progressing": "In progressing",
      "shipping": "Shipping",
      "cancelled": "Cancelled",
      "buy_now": "Buy now",
      "add_to_cart": "Add to cart",
      "product_information": "Product Information",
      "made_in": "Made in",
      "brand": "Brand",
      "product_detail": "Product Detail",
      "category": "Category",
      "distributor": "Distributor",
      "unstable_network": "Unstable network !",
      "place_order": "Place order",
      "scan_barcode": "Scan barcode",
      "no_data": "No data",
      "payment": "Payment",
      "confirm": "Confirm",
      "new_address": "Add new address",
      "change_address": "Change address",
      "input": "Input",
      "default_address": "Default address",
      "store_owner_name": "Store ower name",
      "address": "address",
      "submit_information": "Submit information about us ?",
      "edit": "Edit",
      "pick_address": "Pick address",
      "address_list": "Address list",
      "set_default": "Set default",
      "remove_address": "Remove this address",
      "no_shopping_cart": "No shopping cart !",
      "quantity": "Quantity",
      "provided_by": "Provided by",
      "remove_product": "Remove this product ?",
      "submit_order": "Submit order ?",
      "order_info": "Order information",
      "payment_info": "Payment information",
      "term": "Term",
      "confirm_submit_order": "Confirm submit order ?",
      "pause": "Pause",
      "resume": "Resume",
      "total": "Total",
      "delivery_method": "Delivery method",
      "payment_method": "Payment method",
      "note": "Note",
      "empty_data": "Empty data.",
      "miss_info": "Miss info !",
      "order_id": "Order ID : ",
      "order_date": "Order date : ",
      "total_value": "Total value : ",
      "select_ship_method": "Select ship method",
      "select_payment_method": "Select payment method",
    },
    'vi': {
      "ok": "Đồng ý",
      "cancel": "Huỷ bỏ",
      "close": "Đóng",
      "please_waiting": "Đang xử lí...",
      "input_empty": "Vui lòng điền thông tin !",
      "personal_information": "Thông tin cá nhân",
      "save": "Lưu",
      "full_name": "Họ và tên",
      "phone": "Số điện thoại",
      "cart": "Giỏ hàng",
      "store_name": "Tên cửa hàng",
      "profile": "Hồ sơ",
      "ancillary_information": "Bổ sung thông tin",
      "update_detailed": "Cập nhật thông tin cá nhân chi tiết",
      "logout": "Đăng xuất",
      "search": "Tìm kiếm",
      "search_product": "Tìm kiếm sản phẩm",
      "see_all": "Xem tất cả",
      "order": "Đặt hàng",
      "reward": "Săn thưởng",
      "personal": "Cá nhân",
      "hot_deal": "Khuyến mãi",
      "all": "Tất cả",
      "mine": "Của tôi",
      "no_available_data": "Không có dữ liệu !",
      "load_complete": "Load thành công.",
      "shipping_address": "Địa chỉ giao hàng",
      "update_shipping_address": "Cập nhật địa chỉ giao hàng",
      "order_management": "Quản lí đơn hàng",
      "favorite_product": "Sản phẩm yêu thích",
      "favorite_product_list": "Danh sách sản phầm yêu thích",
      "survey": "Khảo sát",
      "next": "Tiếp theo",
      "back": "Quay lại",
      "complete": "Hoàn thành",
      "select": "Tuyển chọn",
      "camera": "Chụp ảnh",
      "gallery": "Thư viện",
      "detail": "Chi tiết",
      "agree_survey": "Đồng ý đăng ký khảo sát này",
      "register": "Đăng ký",
      "confirm_logout": "Bạn muốn đăng xuất ?",
      "update_profile": "Cập nhật thông tin",
      "city_province": "Tỉnh / Thành ",
      "district": "Quận / Huyện",
      "ward": "Phường / Xã",
      "in_progressing": "Chờ xử lý",
      "shipping": "Đang giao",
      "cancelled": "Bị huỷ",
      "buy_now": "Mua ngay",
      "add_to_cart": "Thêm vào giỏ hàng",
      "product_information": "Thông tin sản phẩm",
      "made_in": "Sản xuất tại",
      "brand": "Thương hiệu",
      "product_detail": "Chi tiết sản phẩm",
      "category": "Danh mục",
      "distributor": "Nhà phân phối",
      "unstable_network": "Đường truyền không ổn định !",
      "place_order": "Tiến hành đặt hàng",
      "scan_barcode": "Quét mã vạch",
      "no_data": "Chưa có dữ liệu",
      "payment": "Thanh toán",
      "confirm": "Xác nhận",
      "new_address": "Thêm địa chỉ mới",
      "change_address": "Đổi địa chỉ",
      "input": "Nhập liệu",
      "default_address": "Địa chỉ mặc định",
      "store_owner_name": "Tên chủ cửa hàng",
      "address": "Địa chỉ",
      "submit_information": "Gửi thông tin về chúng tôi ?",
      "edit": "Chỉnh sửa",
      "pick_address": "Chọn địa chỉ",
      "address_list": "Danh sách địa chỉ",
      "set_default": "Đặt làm mặc định",
      "remove_address": "Xoá địa chỉ này",
      "no_shopping_cart": "Bạn chưa có giỏ hàng nào !",
      "quantity": "Số lượng",
      "provided_by": "Cung cấp bởi",
      "remove_product": "Xoá sản phẩm này ?",
      "submit_order": "Ký gửi đơn hàng",
      "order_info": "Thông tin đơn hàng",
      "payment_info": "Thông tin thanh toán",
      "term": "Điều khoản",
      "confirm_submit_order": "Xác nhận gửi đơn hàng ?",
      "pause": "Tạm dừng",
      "resume": "Tiếp tục",
      "total": "Tổng tiền",
      "delivery_method": "Phương thức giao hàng",
      "payment_method": "Phương thức thanh toán",
      "note": "Ghi chú",
      "empty_data": "Chưa có dữ liệu.",
      "miss_info": "Thiếu thông tin !",
      "order_id": "Mã đơn hàng : ",
      "order_date": "Ngày đặt hàng : ",
      "total_value": "Tổng giá trị : ",
      "select_ship_method": "Chọn phương thức giao hàng",
      "select_payment_method": "Chọn phương thức thanh toán",
    }
  };

  String get ok => localizedValues[locale.languageCode]['ok'];

  String get cancel => localizedValues[locale.languageCode]['cancel'];

  String get close => localizedValues[locale.languageCode]['close'];

  String get pleaseWaiting =>
      localizedValues[locale.languageCode]['please_waiting'];

  String get inputEmpty => localizedValues[locale.languageCode]['input_empty'];

  String get personalInformation =>
      localizedValues[locale.languageCode]['personal_information'];

  String get save => localizedValues[locale.languageCode]['save'];

  String get fullName => localizedValues[locale.languageCode]['full_name'];

  String get phone => localizedValues[locale.languageCode]['phone'];

  String get cart => localizedValues[locale.languageCode]['cart'];

  String get scanBarcode =>
      localizedValues[locale.languageCode]['scan_barcode'];

  String get storeName => localizedValues[locale.languageCode]['store_name'];

  String get profile => localizedValues[locale.languageCode]['profile'];

  String get ancillaryInformation =>
      localizedValues[locale.languageCode]['ancillary_information'];

  String get updateDetailed =>
      localizedValues[locale.languageCode]['update_detailed'];

  String get shippingAddress =>
      localizedValues[locale.languageCode]['shipping_address'];

  String get updateShippingAddress =>
      localizedValues[locale.languageCode]['update_shipping_address'];

  String get orderManagement =>
      localizedValues[locale.languageCode]['order_management'];

  String get favoriteProduct =>
      localizedValues[locale.languageCode]['favorite_product'];

  String get favoriteProductList =>
      localizedValues[locale.languageCode]['favorite_product_list'];

  String get logout => localizedValues[locale.languageCode]['logout'];

  String get search => localizedValues[locale.languageCode]['search'];

  String get searchProduct =>
      localizedValues[locale.languageCode]['search_product'];

  String get seeAll => localizedValues[locale.languageCode]['see_all'];

  String get order => localizedValues[locale.languageCode]['order'];

  String get reward => localizedValues[locale.languageCode]['reward'];

  String get personal => localizedValues[locale.languageCode]['personal'];

  String get hotDeal => localizedValues[locale.languageCode]['hot_deal'];

  String get all => localizedValues[locale.languageCode]['all'];

  String get mine => localizedValues[locale.languageCode]['mine'];

  String get loadComplete =>
      localizedValues[locale.languageCode]['load_complete'];

  String get noAvailableData =>
      localizedValues[locale.languageCode]['no_available_data'];

  String get survey => localizedValues[locale.languageCode]['survey'];

  String get next => localizedValues[locale.languageCode]['next'];

  String get back => localizedValues[locale.languageCode]['back'];

  String get complete => localizedValues[locale.languageCode]['complete'];

  String get select => localizedValues[locale.languageCode]['select'];

  String get camera => localizedValues[locale.languageCode]['camera'];

  String get gallery => localizedValues[locale.languageCode]['gallery'];

  String get detail => localizedValues[locale.languageCode]['detail'];

  String get agreeSurvey =>
      localizedValues[locale.languageCode]['agree_survey'];

  String get register => localizedValues[locale.languageCode]['register'];

  String get confirmLogout =>
      localizedValues[locale.languageCode]['confirm_logout'];

  String get updateProfile =>
      localizedValues[locale.languageCode]['update_profile'];

  String get cityProvince =>
      localizedValues[locale.languageCode]['city_province'];

  String get inProgressing =>
      localizedValues[locale.languageCode]['in_progressing'];

  String get shipping => localizedValues[locale.languageCode]['shipping'];

  String get cancelled => localizedValues[locale.languageCode]['cancelled'];

  String get buyNow => localizedValues[locale.languageCode]['buy_now'];

  String get addToCart => localizedValues[locale.languageCode]['add_to_cart'];

  String get productInformation =>
      localizedValues[locale.languageCode]['product_information'];

  String get madeIn => localizedValues[locale.languageCode]['made_in'];

  String get brand => localizedValues[locale.languageCode]['brand'];

  String get productDetail =>
      localizedValues[locale.languageCode]['product_detail'];

  String get category => localizedValues[locale.languageCode]['category'];

  String get distributor => localizedValues[locale.languageCode]['distributor'];

  String get unstableNetwork =>
      localizedValues[locale.languageCode]['unstable_network'];

  String get placeOrder => localizedValues[locale.languageCode]['place_order'];

  String get noData => localizedValues[locale.languageCode]['no_data'];

  String get payment => localizedValues[locale.languageCode]['payment'];

  String get confirm => localizedValues[locale.languageCode]['confirm'];

  String get newAddress => localizedValues[locale.languageCode]['new_address'];

  String get changeAddress =>
      localizedValues[locale.languageCode]['change_address'];

  String get input => localizedValues[locale.languageCode]['input'];

  String get defaultAddress =>
      localizedValues[locale.languageCode]['default_address'];

  String get storeOwnerName =>
      localizedValues[locale.languageCode]['store_owner_name'];

  String get address => localizedValues[locale.languageCode]['address'];

  String get district => localizedValues[locale.languageCode]['district'];

  String get ward => localizedValues[locale.languageCode]['ward'];

  String get edit => localizedValues[locale.languageCode]['edit'];

  String get pickAddress =>
      localizedValues[locale.languageCode]['pick_address'];

  String get submitInformation =>
      localizedValues[locale.languageCode]['submit_information'];

  String get addressList =>
      localizedValues[locale.languageCode]['address_list'];

  String get setDefault => localizedValues[locale.languageCode]['set_default'];

  String get removeAddress =>
      localizedValues[locale.languageCode]['remove_address'];

  String get noShoppingCart =>
      localizedValues[locale.languageCode]['no_shopping_cart'];

  String get quantity => localizedValues[locale.languageCode]['quantity'];

  String get providedBy => localizedValues[locale.languageCode]['provided_by'];

  String get removeProduct =>
      localizedValues[locale.languageCode]['remove_product'];

  String get submitOrder =>
      localizedValues[locale.languageCode]['submit_order'];

  String get orderInfo => localizedValues[locale.languageCode]['order_info'];

  String get paymentInfo =>
      localizedValues[locale.languageCode]['payment_info'];

  String get term => localizedValues[locale.languageCode]['term'];

  String get pause => localizedValues[locale.languageCode]['pause'];

  String get resume => localizedValues[locale.languageCode]['resume'];

  String get total => localizedValues[locale.languageCode]['total'];

  String get note => localizedValues[locale.languageCode]['note'];

  String get emptyData => localizedValues[locale.languageCode]['empty_data'];

  String get missInfo => localizedValues[locale.languageCode]['miss_info'];

  String get deliveryMethod =>
      localizedValues[locale.languageCode]['delivery_method'];

  String get paymentMethod =>
      localizedValues[locale.languageCode]['payment_method'];

  String get confirmSubmitOrder =>
      localizedValues[locale.languageCode]['confirm_submit_order'];

  String get orderID => localizedValues[locale.languageCode]['order_id'];

  String get orderDate => localizedValues[locale.languageCode]['order_date'];

  String get totalValue => localizedValues[locale.languageCode]['total_value'];

  String get selectShipMethod =>
      localizedValues[locale.languageCode]['select_ship_method'];

  String get selectPaymentMethod =>
      localizedValues[locale.languageCode]['select_payment_method'];
}
