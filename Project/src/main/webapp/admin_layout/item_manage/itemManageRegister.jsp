<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
<!--         frontController로 이동하면 root부터 경로시작함 -->
    	<link rel="stylesheet" href="admin_layout/css/style.css">
    	<link rel="stylesheet" href="admin_layout/css/admin.css">
    </head>
    <body>
      	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
        <div id="wrap">
            <main id="container">
                <form action="itemInsert.ad" method="post" enctype="multipart/form-data" >
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>상품명</label>
                                    <input type="text" name="i_name" class="product_manage_name" required>
                                </li>
                                <li>
                                    <label>상품코드</label>
                                    <input type="text" name="i_id" class="product_manage_code" required>
                                </li>
                                <li>
                                    <label>가격</label>
                                    <input type="text" name="i_price" class="product_manage_name" required>
                                </li>
                                <li>
                                    <label>할인율(%)</label>
                                    <input type="text" name="i_discount" class="product_manage_discount" required>
                                </li>
                                <li>
                                    <label>요약설명</label>
                                    <input type="text" name="i_desc" class="product_manage_info" required>
                                </li>
                                <li>
                                    <label>size(S/M/L)</label>
                                    <select class="product_manage_size" name="i_size" required>
                                        <option value="null">선택</option>
                                        <option value="S">Small</option>
                                        <option value="M">Medium</option>
                                        <option value="L">Large</option>
                                    </select>
                                </li>
                                <li>
                                    <label>현재수량</label>
                                    <input type="text" name="i_inven" class="product_manage_inven" required>
                                </li>
                                <li>
                                    <label>진열상태</label>
                                    <select class="product_manage_dpstatus" name="i_dpstatus" required>
                                        <option value="">선택</option>
                                        <option value="prepare">준비중</option>
                                        <option value="on sale">판매중</option>
                                        <option value="sold out">매진</option>
                                    </select>
                                </li>
                                <li>
                                    <label>제품상태</label> <!--신상품, 재입고-->
                                    <select class="product_manage_productstatus" name="i_itemstatus" required>
                                        <option value="">선택</option>
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
                                    <input type="file" name="i_subimg2" class="product_manage_subimg1">
                                </li>
                                <li>
                                    <label>서브이미지2</label>
                                    <input type="file" name="i_subimg3" class="product_manage_subimg2">
                                </li>
                                <li>
                                    <label>서브이미지3</label>
                                    <input type="file" name="i_subimg4" class="product_manage_subimg3">
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
                        <input type="button" value="수정" onclick="location.href='#'" class="btn_m btn_gray">
                        <input type="button" value="삭제" onclick="location.href='#'" class="btn_m btn_gray">
                    </div>
                </form>
            </main>

        </div>
    </body>
</html>