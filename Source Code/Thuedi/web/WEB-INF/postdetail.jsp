<%-- 
    Document   : postdetail
    Created on : Mar 8, 2022, 5:59:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEaRkuGOICP3om0r-q8qdGYqv2Ur1Wf1s&libraries=places&callback=initialize" async defer></script>
    </head>
    <body>
        <h1>${requestScope.error}</h1>
        <h1>
            ${requestScope.post.getTitle()}
            <br>
            ${requestScope.post.getDetail()}
            <br>
            ${requestScope.post.getPrice()}
            <br>
            ${requestScope.post.getArea()}
            <br>
            ${requestScope.post.getNumberOfBedrooms()}
            <br>
            ${requestScope.post.getDirection()}
            <br>
            ${requestScope.post.getAddress()}
            <br>
            ${requestScope.post.getAddressDetail()}
            <br>
            ${requestScope.post.getPropertyType()}
            <br>
            ${requestScope.post.getCreateDate()}
            <br>
        </h1>

        <div id="map" style="width: 50vw; height: 50vh;"></div>

        <script>
            var map;

            function initialize() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 21.024178, lng: 105.832500},
                    zoom: 12
                });

                var request = {
                    location: map.getCenter(),
                    radius: '500',
                    query: '${requestScope.post.getAddressDetail()}'
                };

                var service = new google.maps.places.PlacesService(map);
                service.textSearch(request, callback);
            }
            // Checks that the PlacesServiceStatus is OK, and adds a marker
            // using the place ID and location from the PlacesService.
            function callback(results, status) {
                console.log(status, results);
                if (status == google.maps.places.PlacesServiceStatus.OK) {
                    var marker = new google.maps.Marker({
                        map: map,
                        place: {
                            placeId: results[0].place_id,
                            location: results[0].geometry.location
                        }
                    });
                }
            }
        </script>

        <form method="post" action="comment?id=${requestScope.post.getId()}">
            <textarea name="content"></textarea>
            <button>Comment</button>
        </form>
        <c:forEach items="${requestScope.comments}" var="comment">
            <div>
                <h5>${comment.getComment()}</h5>
                <h5>${comment.getUserId()}</h5>
                <h5>${comment.getCreateDate()}</h5>
                <form method="post" action="comment?commentId=${comment.getId()}">
                    <button>Delete</button>
                </form>
            </div>
        </c:forEach>
    </body>
</html>
