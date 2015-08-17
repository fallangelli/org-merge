<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title> 测试</title>
    <link rel="stylesheet" href="../../asset/css/screen.css" media="screen"/>
    <link rel="stylesheet" href="../../asset/css/jquery.treetable.css"/>
    <link rel="stylesheet" href="../../asset/css/jquery.treetable.theme.default.css"/>
</head>
<body>
<div id="main">


    <p>二代合并结果</p>

    <div style="height:500px;overflow:auto;">
        <table id="tree_qy">

            <thead>
            <tr>
                <th>编号</th>
                <th>名称</th>
                <th>错误</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${treeData}" var="item">
                <tr data-tt-id='${item.ttId}' data-tt-parent-id='${item.ttParentId}'>
                    <td><span class='file'>${item.orgCode}</span></td>
                    <td>${item.orgName}</td>
                    <td>${item.problem}</td>
                </tr>
            </c:forEach>/

            </tbody>
        </table>
    </div>

</div>


<script src="../../asset/js/jquery.js"></script>
<script src="../../asset/js/jquery.ui.core.js"></script>
<script src="../../asset/js/jquery.ui.widget.js"></script>
<script src="../../asset/js/jquery.ui.mouse.js"></script>
<script src="../../asset/js/jquery.ui.draggable.js"></script>
<script src="../../asset/js/jquery.ui.droppable.js"></script>
<script src="../../asset/js/jquery.treetable.js"></script>
<script>


    $("#tree_qy").treetable({expandable: true, initialState: "expanded"});

    $("#tree_ed").treetable({expandable: true, initialState: "expanded"});
</script>


</body>
</html>
