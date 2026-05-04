class UserModel {
  String? uuid;
  String? firstName;
  String? lastName;
  String? internationalFirstName;
  String? internationalLastName;
  String? nationalCode;
  String? birthDate;
  String? phoneNumber;
  String? email;

  int? provinceCityId;
  String? provinceCityName;
  String? provinceName;
  int? provinceId;
  int? countryId;
  String? countryName;

  String? profileImageUrl;

  bool? isActive;
  int? userStatus;

  String? createDate;
  String? updatedBy;
  String? language;
  String? registerWay;

  String? gender;
  String? address;
  String? locationCoordinates;

  int? haveMessage;
  String? brandUuid;

  int? orderCount;
  int? isBrandAdmin;
  bool? isAdmin;

  bool? brandUserIsActive;
  bool? isCustomerSupport;
  bool? isDataAnalyst;
  bool? isInventoryManager;
  bool? isOrderReceptionist;
  bool? isSalesExpert;
  bool? isStoreManager;
  bool? isSystemManager;

  bool? isServiceManager;
  bool? haveService;

  List<dynamic>? brandsRequest;
  List<dynamic>? plan;
  List<dynamic>? brandOwnerRequests;

  UserModel({
    this.uuid,
    this.firstName,
    this.lastName,
    this.internationalFirstName,
    this.internationalLastName,
    this.nationalCode,
    this.birthDate,
    this.phoneNumber,
    this.email,
    this.provinceCityId,
    this.provinceCityName,
    this.provinceName,
    this.provinceId,
    this.countryId,
    this.countryName,
    this.profileImageUrl,
    this.isActive,
    this.userStatus,
    this.createDate,
    this.updatedBy,
    this.language,
    this.registerWay,
    this.gender,
    this.address,
    this.locationCoordinates,
    this.haveMessage,
    this.brandUuid,
    this.orderCount,
    this.isBrandAdmin,
    this.isAdmin,
    this.brandUserIsActive,
    this.isCustomerSupport,
    this.isDataAnalyst,
    this.isInventoryManager,
    this.isOrderReceptionist,
    this.isSalesExpert,
    this.isStoreManager,
    this.isSystemManager,
    this.isServiceManager,
    this.haveService,
    this.brandsRequest,
    this.plan,
    this.brandOwnerRequests,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uuid: json['uuid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      internationalFirstName: json['international_first_name'],
      internationalLastName: json['international_last_name'],
      nationalCode: json['national_code'],
      birthDate: json['birth_date'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      provinceCityId: json['province_city_id'],
      provinceCityName: json['province_city_name'],
      provinceName: json['province_name'],
      provinceId: json['province_id'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      profileImageUrl: json['profile_image_url'],
      isActive: json['is_active'],
      userStatus: json['user_status'],
      createDate: json['create_date'],
      updatedBy: json['updated_by'],
      language: json['language'],
      registerWay: json['register_way'],
      gender: json['gender'],
      address: json['address'],
      locationCoordinates: json['location_coordinates'],
      haveMessage: json['have_message'],
      brandUuid: json['brand_uuid'],
      orderCount: json['order_count'],
      isBrandAdmin: json['is_brand_admin'],
      isAdmin: json['is_admin'],
      brandUserIsActive: json['brand_user_is_active'],
      isCustomerSupport: json['is_customer_support'],
      isDataAnalyst: json['is_data_analyst'],
      isInventoryManager: json['is_inventory_manager'],
      isOrderReceptionist: json['is_order_receptionist'],
      isSalesExpert: json['is_sales_expert'],
      isStoreManager: json['is_store_manager'],
      isSystemManager: json['is_system_manager'],
      isServiceManager: json['is_service_manager'],
      haveService: json['have_service'],
      brandsRequest: json['brands_request'] ?? [],
      plan: json['plan'] ?? [],
      brandOwnerRequests: json['brand_owner_requests'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uuid": uuid,
      "first_name": firstName,
      "last_name": lastName,
      "international_first_name": internationalFirstName,
      "international_last_name": internationalLastName,
      "national_code": nationalCode,
      "birth_date": birthDate,
      "phone_number": phoneNumber,
      "email": email,
      "province_city_id": provinceCityId,
      "province_city_name": provinceCityName,
      "province_name": provinceName,
      "province_id": provinceId,
      "country_id": countryId,
      "country_name": countryName,
      "profile_image_url": profileImageUrl,
      "is_active": isActive,
      "user_status": userStatus,
      "create_date": createDate,
      "updated_by": updatedBy,
      "language": language,
      "register_way": registerWay,
      "gender": gender,
      "address": address,
      "location_coordinates": locationCoordinates,
      "have_message": haveMessage,
      "brand_uuid": brandUuid,
      "order_count": orderCount,
      "is_brand_admin": isBrandAdmin,
      "is_admin": isAdmin,
      "brand_user_is_active": brandUserIsActive,
      "is_customer_support": isCustomerSupport,
      "is_data_analyst": isDataAnalyst,
      "is_inventory_manager": isInventoryManager,
      "is_order_receptionist": isOrderReceptionist,
      "is_sales_expert": isSalesExpert,
      "is_store_manager": isStoreManager,
      "is_system_manager": isSystemManager,
      "is_service_manager": isServiceManager,
      "have_service": haveService,
      "brands_request": brandsRequest,
      "plan": plan,
      "brand_owner_requests": brandOwnerRequests,
    };
  }
}