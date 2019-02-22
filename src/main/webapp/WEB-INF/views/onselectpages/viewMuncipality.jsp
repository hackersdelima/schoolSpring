<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list }" var="l">
<option value="${l.vdccode }">${l.vdcname }</option>
</c:forEach>