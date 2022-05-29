import "./styles/main.less"
import "nprogress/nprogress.css"
import NProgress from "nprogress"

NProgress.start();
document.addEventListener("DOMContentLoaded", function () {
    NProgress.done()
});