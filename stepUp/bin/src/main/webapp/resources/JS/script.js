window.onload = function(){

    
    let gnb = document.querySelector("#gnb");
    let header = document.getElementById("header");
    let bestright = document.getElementById("bestright");
    let title = document.querySelector("#gnb>li");
    let target = document.querySelector("#gnb>li>a");

    //서브메뉴
    gnb.addEventListener("mouseover",function(){
        header.style.height = "320px";
        
    });

    //기본헤더높이
    gnb.addEventListener("mouseout",function(){
        header.style.height = "60px";
    });



}



  window.addEventListener("scroll", function(){
    let html = document.documentElement;
    let htmlTop = html.scrollTop;
    let newBanner = this.document.getElementById("new-banner")
    if(newBanner != null){
        if(htmlTop > 50){
            newBanner.style.height = "15vh";
        }else{
            newBanner.style.height = "90vh";
        }
    }
  });




  


