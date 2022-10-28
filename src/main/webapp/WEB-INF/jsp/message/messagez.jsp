<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../framePage/sideBar.jsp"></jsp:include>
<form action="">
    <Table>
        <tr>
            <th><p>發送者</p></th>
            <th><p>標題</p></th>
            <th><p>時間</p></th>
        </tr>
        <tr>
            <td><p>國一班導 ${parent.name}</p></td>
            <td><p>翹課</p></td>
            <td><p>10/10</p></td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="showMSG">
                    供了三小
                    <p class="threeButton">
                        <button type="button" class="btn btn-danger">刪除</button>
                        <button type="button" class="btn btn-primary">回信</button>
                        <button>收合</button>
                    </p>
                </div>
            </td>
        </tr>
    </Table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
    crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>//=======================版面動作=======================
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
//==========================end of bar=============================
</script>

</html>