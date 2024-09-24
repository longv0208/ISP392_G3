<%-- 
    Document   : homepage
    Created on : Sep 24, 2024, 12:25:09 AM
    Author     : khucx
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/style.css" />
        <link rel="stylesheet" href="./index.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@600&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Avenir:wght@400&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    </head>
    <body>
        <div class="homepage-student">
            <div class="homepage-student-child">
            </div>
            <div class="university-academic-portal1 mt-1">University Academic Portal</div>
            <a href="landing.jsp" class="homepage-student-item bg-white flex hover:bg-slate-200 duration-200">
                <div class=" text-[18px] ml-[20px] mt-[12px]"> Log out </div>
                <svg class="mt-[14px] ml-[8px]" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M13.4766 21.2448H8.34056C7.04866 21.3045 5.78525 20.8527 4.82396 19.9876C3.86267 19.1224 3.28088 17.9134 3.20459 16.6224V7.37762C3.28088 6.08659 3.86267 4.87757 4.82396 4.01241C5.78525 3.14724 7.04866 2.69559 8.34056 2.75524H13.4766" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M20.7952 12H7.44165" stroke="black" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round"/>
                <path d="M16.0833 17.136L20.4874 12.7319C20.6802 12.5371 20.7884 12.2742 20.7884 12C20.7884 11.7259 20.6802 11.4629 20.4874 11.2681L16.0833 6.86401" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>

            </a>
            <c:if test="${sessionScope.role == student}">
                
            <div class="homepage-student-inner">
            </div>
            <div class="rectangle-div">
            </div>
            <div class="homepage-student-child1">
            </div>
            <div class="notificationsthng-bo">Notifications/Thông báo</div>
            <div class="profile-brief">
                <div class="profile-brief-child">
                </div>
                <div class="name">Khúc Xuân Hòa</div>
                <div class="roll-number">HE163890</div>
                <img class="photo-4-1682302453807184190466-icon" alt="" src="photo-4-1682302453807184190466 1.png">
            </div>
            <a href="" class="profile-detail">
                <div class="profile-detail-child">
                </div>
                <svg class="hs-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M19.6177 21.25C19.6177 17.6479 15.6021 14.7206 12 14.7206C8.39791 14.7206 4.38232 17.6479 4.38232 21.25" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M11.9999 11.4559C14.4039 11.4559 16.3528 9.50701 16.3528 7.10294C16.3528 4.69888 14.4039 2.75 11.9999 2.75C9.59585 2.75 7.64697 4.69888 7.64697 7.10294C7.64697 9.50701 9.59585 11.4559 11.9999 11.4559Z" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>

                <div class="xem-h-s">Xem hồ sơ</div>
            </a>
            <div class="group-parent">
                <div class="rectangle-parent">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-wrapper">
                        <a href="" class="thng-bo-ti hover:underline">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </a>
                    </div>
                </div>
                <div class="rectangle-group">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="rectangle-container">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="group-div">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="rectangle-parent1">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="rectangle-parent2">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="rectangle-parent3">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="rectangle-parent4">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
                <div class="rectangle-parent5">
                    <div class="group-child">
                    </div>
                    <div class="noti-time">20/09/24 10:59</div>
                    <div class="thng-bo-ti-sinh-vin-v-lc-container">
                        <div class="thng-bo-ti">Thông báo tới sinh viên về lịch học ngày 21/09, vì thời tiết mưa lớn khiến nhiều nơi ngập lụt </div>
                    </div>
                </div>
            </div>
            <div class="rectangle-parent6">
                <div class="group-child7">
                </div>
                <div class="academic-information">Academic Information/Thông tin</div>
            </div>
            <div class="registraion">
                <div class="registrationng-k">Registration/Đăng ký</div>
                <div class="register-courses-container">
                    <ul class="register-courses-ng-k-mn list-disc">
                        <li class="register-courses">
                            <a href="" class="hover:underline">Register courses / Đăng ký môn học</a>
                        </li>
                        <li>
                            <a href="" class="hover:underline">Register dorm room / Đăng ký phòng ký túc xá</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="informaion">
                <div class="registrationng-k">Information access/Tra cứu thông tin</div>
                <div class="weekly-timetable-container">
                    <ul class="register-courses-ng-k-mn list-disc ">
                        <li class="register-courses hover:underline"><a href="">Weekly timetable / Thời khóa biểu hàng tuần</a></li>
                        <li class="register-courses hover:underline"><a href="">Assignment / Bài tập</a></li>
                        <li class="register-courses hover:underline"><a href="">View exam schedule / Xem lịch thi</a></li>
                        <li><a class="hover:underline" href="">Student guide / Hướng dẫn sinh viên</a></li>
                    </ul>
                </div>
            </div>
            <div class="application">
                <div class="registrationng-k">Application/Đơn từ</div>
                <div class="register-courses-container">
                    <ul class="register-courses-ng-k-mn list-disc">
                        <li class="register-courses hover:underline"><a href="">Send application / Gửi đơn</a></li>
                        <li><a class="hover:underline" href="">View application / Xem đơn đã gửi</a></li>
                    </ul>
                </div>
            </div>
            <div class="report">
                <div class="registrationng-k">Report/Báo cáo</div>
                <div class="attendance-report-container">
                    <ul class="register-courses-ng-k-mn list-disc">
                        <li class="register-courses hover:underline"><a href="">Attendance report / Báo cáo điểm danh</a></li>
                        <li class="register-courses hover:underline"><a href="">Mark report / Báo cáo điểm</a></li>
                        <li><a href="" class="hover:underline">Curriculum / Khung chương trình</a></li>
                    </ul>
                </div>
            </div>
            <div class="finance">
                <div class="registrationng-k">Finance/Tài chính</div>
                <div class="pay-paid-items-container">
                    <ul class="register-courses-ng-k-mn list-disc">
                        <li class="register-courses hover:underline"><a href="">Pay paid items / Thanh toán các khoản nộp</a></li>
                        <li><a href="" class="hover:underline">Transaction history / Lịch sử giao dịch</a></li>
                    </ul>
                </div>
            </div>
            <img class="line-icon" alt="" src="Line 2.svg">
            </c:if>
            <div class="mi-thc-mc-kin-vui-lng-parent">
                <div class="mi-thc-mc">Mọi thắc mắc, ý kiến vui lòng liên hệ:</div>
                <div class="phng-dch-v-container">
                    <p class="phng-dch-v">Phòng dịch vụ sinh viên: </p>
                    <p class="phng-dch-v">SĐT: 0123456789</p>
                    <p class="phng-dch-v">Email: abcdef@edu.com</p>
                </div>
                <div class="phng-o-to-container">
                    <p class="phng-dch-v">Phòng đào tạo: </p>
                    <p class="phng-dch-v">SĐT: 0123456789</p>
                    <p class="phng-dch-v">Email: abcdef@edu.com</p>
                </div>
            </div>
        </div>
    </body>
</html>
