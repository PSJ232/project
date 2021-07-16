s<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div id="wrap">
            <main id="main_layout">
                <form action="">
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>상품명</label>
                                    <input type="text" class="product_manage_name">
                                </li>
                                <li>
                                    <label>상품코드</label>
                                    <input type="text" class="product_manage_code">
                                </li>
                                <li>
                                    <label>가격</label>
                                    <input type="text" class="product_manage_name">
                                </li>
                                <li>
                                    <label>할인율(%)</label>
                                    <input type="text" class="product_manage_discount">
                                </li>
                                <li>
                                    <label>요약설명</label>
                                    <input type="text" class="product_manage_info">
                                </li>
                                <li>
                                    <label>size(S/M/L)</label>
                                    <select class="product_manage_size">
                                        <option value="null">선택</option>
                                        <option value="S">Small</option>
                                        <option value="M">Medium</option>
                                        <option value="L">Large</option>
                                    </select>
                                </li>
                                <li>
                                    <label>현재수량</label>
                                    <input type="text" class="product_manage_inven">
                                </li>
                                <li>
                                    <label>진열상태</label>
                                    <select class="product_manage_dpstatus">
                                        <option value="null">선택</option>
                                        <option value="prepare">준비중</option>
                                        <option value="on sale">판매중</option>
                                        <option value="sold out">매진</option>
                                    </select>
                                </li>
                                <li>
                                    <label>제품상태</label> <!--신상품, 재입고-->
                                    <select class="product_manage_productstatus">
                                        <option value="null">선택</option>
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
                                    <input type="file" class="product_manage_mainimg">
                                </li>
                                <li>
                                    <label>서브이미지1</label>
                                    <input type="file" class="product_manage_subimg1">
                                </li>
                                <li>
                                    <label>서브이미지2</label>
                                    <input type="file" class="product_manage_subimg2">
                                </li>
                                <li>
                                    <label>서브이미지3</label>
                                    <input type="file" class="product_manage_subimg3">
                                </li>
                                <li>
                                    <label>상세설명</label>
                                    <input type="file" class="product_manage_detailpage">
                                </li>
                            </ul>
                        </div>
                    </section>
                    <div class="product_manage_btnbox">
                        <input type="button" value="등록" onclick="location.href='#'" class="btn_m btn_yellow">
                        <input type="button" value="수정" onclick="location.href='#'" class="btn_m btn_gray">
                        <input type="button" value="삭제" onclick="location.href='#'" class="btn_m btn_gray">
                    </div>
                </form>
            </main>

        </div>
    </body>
</html>