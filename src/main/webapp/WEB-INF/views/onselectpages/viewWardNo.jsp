<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
${mun.wardcount}
<c:forEach begin="1" end="${mun.wardcount }" varStatus="i">
<option value="${i.index }">${i.index }</option>
</c:forEach>
