<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(".form-box").on("input", "input", function(){
    var _val = $(this).val();
    if (_val != 0) {
        $(this).addClass('values');
    } else {
        $(this).removeClass('values');
    }
})
</script>
</body>
</html>