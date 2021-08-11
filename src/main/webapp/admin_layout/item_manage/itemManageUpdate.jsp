<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ItemBean ib = (ItemBean)request.getAttribute("itemDetail");
%>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="./css/admin.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
    <body>
        <!-- header -->
      	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
      	<!-- header -->
      	
   	    <!-- nav -->
		<jsp:include page="/inc/navigation.jsp" ></jsp:include>
		<!-- nav -->
        <div id="container">
            <main id="main_layout">
                <form action="ItemUpdate.ad" method="post" enctype="multipart/form-data">
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>상품명</label>
                                    <input type="text" class="product_manage_name" name="i_name" value="<%=ib.getI_name()%>" required>
                                </li>
                                <li>
                                    <label>상품코드</label>
                                    <input type="text" class="product_manage_code" name="i_id" value="<%=ib.getI_id()%>" readonly>
                                </li>
                                <li>
                                    <label>제품등록일</label>
                                    <input type="text" class="product_manage_name" name="i_rdate" value="<%=ib.getI_rdate()%>" disabled>
                                </li>
                                <li>
                                    <label>가격</label>
                                    <input type="text" class="product_manage_name" name="i_price" value="<%=ib.getI_price()%>" required>
                                </li>
                                <li>
                                    <label>할인율(%)</label>
                                    <select name="i_discount" class="product_manage_discount" data-discount="<%=(int)(ib.getI_discount()) %>" required>
                                    	<option value="">선택하세요</option>
                                    	<option value="1">할인 없음</option>
                                    	<option value="0.9">10%</option>
                                    	<option value="0.8">20%</option>
                                    	<option value="0.7">30%</option>
                                    	<option value="0.6">40%</option>
                                    	<option value="0.5">50%</option>
                                    </select>
                                </li>
                                <li>
                                    <label>요약설명</label>
                                    <input type="text" class="product_manage_info" name="i_desc" value="<%=ib.getI_desc()%>" required>
                                </li>
                                <li>
                                    <label>카테고리</label>
                                    <select name="i_category" class="product_manage_category" data-category="<%=ib.getI_category() %>" required>
                                    	<option value="">선택하세요</option>
                                    	<option value="1">일반상품</option>
                                    	<option value="2">당일배송</option>
                                    	<option value="3">정기구독</option>
                                    </select>
                                </li>
                                <li>
                                    <label>size(S/M/L)</label>
                                    <select class="product_manage_size" name="i_size" data-size="<%=ib.getI_size() %>" required>
                                        <option value="">선택하세요</option>
                                        <option value="S">Small</option>
                                        <option value="M">Medium</option>
                                        <option value="L">Large</option>
                                        <option value="XL">XLarge</option>
                                    </select>
                                </li>
                                <li>
                                    <label>현재수량</label>
                                    <input type="text" class="product_manage_inven" name="i_inven" value="<%=ib.getI_inven()%>" required>
                                </li>
                                <li>
                                    <label>진열 여부</label>
                                    <select class="product_manage_dpstatus" name="i_dpstatus" data-dpstatus="<%=ib.getI_dpstatus() %>" required>
                                        <option value="">선택하세요</option>
                                        <option value="판매">판매</option>
                                        <option value="비판매">비판매</option>
                                    </select>
                                </li>
                                <li>
                                    <label>상품 상태</label> <!--신상품, 재입고-->
                                    <select class="product_manage_productstatus" name="i_itemstatus" data-itemstatus="<%=ib.getI_itemstatus() %>" required>
                                        <option value="">선택하세요</option>
                                        <option value="prepare">준비중</option>
                                        <option value="on sale">판매중</option>
                                        <option value="sold out">매진</option>
                                    </select>
                                </li>
                        	</ul> 
                    	</div>
               		</section>
            
	                <section class="product_manage_box">
	                    <div>
	                        <ul class="product_manage_layout">
	                            <li>
	                                <label>메인이미지</label>
	                                <input type="file" class="product_manage_mainimg img_hidden" name="i_img"><span class="span_show"><%=ib.getI_img()%></span>
									<input type="hidden" name="oldi_img" value="<%=ib.getI_img()%>">
	                            </li>
	                            <li>
	                                <label>서브이미지1</label>
	                                <input type="file" class="product_manage_subimg1 img_hidden" name="i_subimg2"><span class="span_show"><%=ib.getI_subimg2()%></span>
	                                <input type="hidden" name="oldi_subimg2" value="<%=ib.getI_subimg2()%>">
	                            </li>
	                            <li>
	                                <label>서브이미지2</label>
	                                <input type="file" class="product_manage_subimg2 img_hidden" name="i_subimg3"><span class="span_show"><%=ib.getI_subimg3()%></span>
	                                <input type="hidden" name="oldi_subimg3" value="<%=ib.getI_subimg3()%>">
	                            </li>
	                            <li>
	                                <label>서브이미지3</label>
	                                <input type="file" class="product_manage_subimg3 img_hidden" name="i_subimg4"><span class="span_show"><%=ib.getI_subimg4()%></span>
	                                <input type="hidden" name="oldi_subimg4" value="<%=ib.getI_subimg4()%>">
	                            </li>
	                            <li>
	                                <label>상세설명</label>
	                                <input type="file" class="product_manage_detailpage img_hidden" name="i_detailpage"><span class="span_show"><%=ib.getI_detailpage()%></span>
	                                <input type="hidden" name="oldi_detailpage" value="<%=ib.getI_detailpage()%>">
	                            </li>
	                        </ul>
	                    </div>
	                </section>
                <div class="product_manage_btnbox">
                    <input type="submit" value="수정" class="btn_m btn_yellow">
                </div>
            </form>
        </main>

    </div>
    <script type="text/javascript">
	    $(document).ready(function () {
// 	    	alert('dd');
	    	  discount_val = $('.product_manage_discount').attr('data-discount');
	    	  $('.product_manage_discount option[value="' + discount_val + '"]').attr('selected', 'selected');
	    	  
	    	  category_val = $('.product_manage_category').attr('data-category');
	    	  $('.product_manage_category option[value="' + category_val + '"]').attr('selected', 'selected');
	    	  
	    	  size_val = $('.product_manage_size').attr('data-size');
	    	  $('.product_manage_size option[value="' + size_val + '"]').attr('selected', 'selected');
	    	  
	    	  dpstatus_val = $('.product_manage_dpstatus').attr('data-dpstatus');
	    	  $('.product_manage_dpstatus option[value="' + dpstatus_val + '"]').attr('selected', 'selected');
	    	  
	    	  itemstatus_val = $('.product_manage_productstatus').attr('data-itemstatus');
	    	  $('.product_manage_productstatus option[value="' + itemstatus_val + '"]').attr('selected', 'selected');
	    	});
        
    </script>
</body>
</html>