<%-- 
    Document   : updatePost
    Created on : Feb 17, 2022, 9:39:50 PM
    Author     : pinkd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="../Styles/style.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <script src="https://kit.fontawesome.com/e3a507881a.js" crossorigin="anonymous"></script>
    </head>
    <body class="createpost-body">
        <c:if test="${requestScope.errorms != null}">
            <h1>${requestScope.errorms}</h1>
        </c:if>
        <c:set var="post" value="${requestScope.post}"/>
        <div class="createpost-section">
            <h4>Sửa bài đăng</h4>

            <form method="POST" class="createpost-form" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="property_type">Loại bất động sản</label>
                            <select name="property_type" id="property_type" class="createpost-form-control" required>
                                <c:forEach items="${requestScope.propertyType}" var="propertyType">
                                    <option value="${propertyType.getId()}">${propertyType.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" class>
                            <label for="district">Địa chỉ</label>
                            <select class="createpost-form-control" name="district" id="district">
                                <!--<option>Quận, Huyện</option>-->
                                <c:forEach items="${requestScope.districtList}" var="district">
                                    <option value="${district.getId()}">${district.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="address"></label>
                            <select name="address" class="createpost-form-control" id="subdistrict" required>
                                <c:forEach items="${requestScope.subdistrictList}" var="subdistrict">
                                    <option value="${subdistrict.getId()}">${subdistrict.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="address_detail">Địa chỉ chi tiết</label>
                            <input type="text" class="createpost-form-control" id="address_detail" name="address_detail" value="${post.getAddressDetail()}" required/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="direction">Hướng</label>
                            <select class="createpost-form-control" id="direction" name="direction" required >
                                <option value="bac">Bắc</option>
                                <option value="dongbac">Đông Bắc</option>
                                <option value="dong">Đông</option>
                                <option value="dongnam">Đông Nam</option>
                                <option value="nam">Nam</option>
                                <option value="taynam">Tây Nam</option>
                                <option value="tay">Tây</option>
                                <option value="taybac">Tây Bắc</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="form-group ">
                            <label for="nob ">Số phòng ngủ</label>
                            <input type="text " class="createpost-form-control " id="nob" name="nob" value="${post.getNumberOfBedrooms()}" required/>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="form-group ">
                            <label for="nor ">Số phòng vệ sinh</label>
                            <input type="text " class="createpost-form-control " id="nor" name="nor" value="${post.getNumberOfRestrooms()}" required/>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="form-group ">
                            <label for="Area ">Diện tích</label>
                            <input type="text " class="createpost-form-control " id="area" name="area" value="${post.getArea()}" required/>
                        </div>
                    </div>
                    <div class="col-md-12 ">
                        <div class="form-group ">
                            <label for="price ">Giá</label>
                            <input type="number" class="createpost-form-control " id="price" name="price" value="${post.getPrice()}" required/>
                        </div>
                    </div>
                    <div class="col-md-12 ">
                        <div class="form-group ">
                            <label for="title ">Tiêu đề</label>
                            <input type="text " class="createpost-form-control " id="title" name="title" value="${post.getTitle()}" required/>
                        </div>
                    </div>
                    <div class="col-md-12 ">
                        <div class="form-group ">
                            <label for="detail ">Nội dung</label>
                            <textarea type="text " class="createpost-form-control " id="detail" name="detail" required>${post.getDetail()}</textarea>
                        </div>
                    </div>
                    <div class="col-md-12 ">
                        <div class="form-group ">
                            <label for="accept_covid_patient">Chấp nhận người thuê bị nhiễm covid</label>
                            <select class="createpost-form-control" id="accept_covid_patient" name="accept_covid_patient" required >
                                <option value="true">Có</option>
                                <option value="false">Không</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12 ">
                        <div class="form-group ">
                            <label for="image ">Image</label>
                            <input type="file" multiple id="image" name="image" />
                        </div>

                        <div>
                            <c:forEach items="${requestScope.listImageId}" var="imageId">
                                <image class="img-fluid mt-3" src="/Thuedi/PostImage/${imageId}" />
                            </c:forEach>
                                
                                
                        </div>
                    </div>

                </div>

                <button class="submit createpost-submit" type="submit " name=" " id=" ">Đăng bài</button>
            </form>
        </div>

        <script>
            function selectDirection(_direction) {
                [...direction.options].forEach((option, index) => {
                    if (option.value === _direction)
                        direction.selectedIndex = index
                })
            }

            function selectSubDistrict(id) {
                [...subdistrict.options].forEach((option, index) => {
                    if (option.value == id)
                        subdistrict.selectedIndex = index
                })
            }

            function selectDistrict(id) {
                [...district.options].forEach((option, index) => {
                    if (option.value == id)
                        district.selectedIndex = index
                })
            }

            function selectPropertyType(id) {
                [...property_type.options].forEach((option, index) => {
                    if (option.value == id)
                        property_type.selectedIndex = index
                })
            }
            
            function selectAcceptCovidPatient(id) {
                [...accept_covid_patient.options].forEach((option, index) => {
                    if (option.value == id)
                        accept_covid_patient.selectedIndex = index
                })
            }

            selectDirection('${requestScope.post.getDirection()}');
            selectSubDistrict('${requestScope.post.getAddress()}');
            selectDistrict('${requestScope.district.getId()}');
            selectPropertyType('${requestScope.post.getPropertyType()}');
            selectAcceptCovidPatient('${requestScope.post.isAcceptCovidPatient()}');

        </script>
    </body>
</html>
