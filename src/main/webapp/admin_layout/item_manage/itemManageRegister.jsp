<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
<!--         frontController로 이동하면 root부터 경로시작함 -->
    	<link rel="stylesheet" href="./css/admin.css">
    </head>
    <body>
    	<!-- header -->
      	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
      	<!-- header -->
      	
   	    <!-- nav -->
		<jsp:include page="/inc/navigation.jsp" ></jsp:include>
		<!-- nav -->
        <div id="wrap">
            <main id="container">
                <form action="ItemInsert.ad" method="post" enctype="multipart/form-data">
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>상품명</label>
                                    <input type="text" name="i_name" class="product_manage_name" required>
                                </li>
                                <li>
                                    <label>가격</label>
                                    <input type="text" name="i_price" class="product_manage_name" required>
                                </li>
                                <li>
                                    <label>할인율(%)</label>
                                    <select name="i_discount" class="product_manage_size" required>
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
                                    <input type="text" name="i_desc" class="product_manage_info" required>
                                </li>
                                <li>
                                    <label>카테고리</label>
                                    <select name="i_category" class="product_manage_size">
                                    	<option value="1">일반상품</option>
                                    	<option value="2">당일배송</option>
                                    	<option value="3">정기구독</option>
                                    </select>
                                </li>
                                <li>
                                    <label>size(S/M/L)</label>
                                    <select class="product_manage_size" name="i_size" required>
                                        <option value="null">선택하세요</option>
                                        <option value="S">S</option>
                                        <option value="M">M</option>
                                        <option value="L">L</option>
                                        <option value="XL">XL</option>
                                    </select>
                                </li>
                                <li>
                                    <label>현재수량</label>
                                    <input type="text" name="i_inven" class="product_manage_inven" required>
                                </li>
                                <li>
                                    <label>진열 여부</label>
                                    <select class="product_manage_dpstatus" name="i_dpstatus" required>
                                        <option value="">선택하세요</option>
                                        <option value="판매">판매</option>
                                        <option value="비판매">비판매</option>
                                    </select>
                                </li>
                                <li>
                                    <label>상품 상태</label> <!--신상품, 재입고-->
                                    <select class="product_manage_productstatus" name="i_itemstatus" required>
                                        <option value="">선택하세요</option>
                                        <option value="prepare">준비중</option>
                                        <option value="on sale">판매중</option>
                                        <option value="sold out">매진</option>
                                    </select>
                                </li>
                            </ul> 
                        </div>
                    </section>
                	<br>
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>메인이미지</label>
                                    <input type="file" name="i_img" class="product_manage_mainimg" required>
                                </li>
                                <li>
                                    <label>서브이미지1</label>
                                    <input type="file" name="i_subimg2" class="product_manage_subimg1" required>
                                </li>
                                <li>
                                    <label>서브이미지2</label>
                                    <input type="file" name="i_subimg3" class="product_manage_subimg2" required>
                                </li>
                                <li>
                                    <label>서브이미지3</label>
                                    <input type="file" name="i_subimg4" class="product_manage_subimg3" required>
                                </li>
                                <li>
                                    <label>상세설명</label>
                                    <input type="file" name="i_detailpage" class="product_manage_detailpage" required>
                                </li>
                            </ul>
                        </div>
                    </section>
                    <div class="product_manage_btnbox">
                        <input type="submit" value="등록" class="btn_m btn_yellow">
                    </div>
                </form>
            </main>

        </div>
    </body>
</html>