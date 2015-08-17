<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>测试</title>

    <script src="../../asset/js/jquery.js"></script>
    <script src="../../asset/js/jquery.ui.core.js"></script>
    <script src="../../asset/js/jquery.ui.widget.js"></script>
    <script src="../../asset/js/jquery.ui.mouse.js"></script>
    <script src="../../asset/js/jquery.ui.draggable.js"></script>
    <script src="../../asset/js/jquery.ui.droppable.js"></script>
    <link type="text/css" href="${ctx}/asset/zTree/css/zTreeStyle.css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/asset/zTree/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript" src="${ctx}/asset/zTree/jquery.ztree.exhide-3.5.js"></script>
    <script type="text/javascript" src="${ctx}/asset/zTree/jquery.ztree.excheck-3.5.min.js"></script>

    <script type="text/javascript">
        var zTreeObj;
        var setting = {
            view: {
                selectedMulti: true,
                dblClickExpand: true,
                nameIsHTML: true
            },
            callback: {}
        };

        //        function showError() {
        //            alert(zTreeObj);
        //            var errNodes = zTreeObj.getNodesByParam("hasError", true, null);
        //
        //            for (var i = 0; i < errNodes.length; i++) {
        //                zTreeObj.selectNode(errNodes[i]);
        ////                zTreeObj.expandNode(nodes[i], true, true, true);
        //            }
        //
        ////            var normalNodes = zTreeObj.getNodesByParam("hasError", false, null);
        ////            zTreeObj.hideNodes(normalNodes);
        //
        //        }

        $(document).ready(function () {

            $.getJSON("${ctx}/merge/tree", function (data) {
                zTreeObj = $.fn.zTree.init($("#majorTree"), setting, data);
                var errNodes = zTreeObj.getNodesByParam("hasError", true, null);

                for (var i = 0; i < errNodes.length; i++) {
                    zTreeObj.selectNode(errNodes[i]);
                }

            });
        });
    </script>

</head>
<body>
<div id="main">


    <p>二代合并结果</p>
    <%--<button id="showAll" onclick="showAll()">显示全部</button>--%>
    <%--<button id="showError" onclick="showError()">展开错误错误</button>--%>
    <PRE>


        <ul id="majorTree" class="ztree" style="margin-top:0; width:354px; height: 300px;"></ul>
    </PRE>

</div>

</body>
</html>
