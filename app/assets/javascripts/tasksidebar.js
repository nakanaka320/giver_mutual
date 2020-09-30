// サイドバーの表示
$(document).on('click', '#open_close', function(){
  var duration = 600;
  var $aside = $('.taskbar');
  var $asidButton = $aside.find('#open_close')
      .on('click', function(){
          $aside.toggleClass('open');
          if($aside.hasClass('open')){
              $aside.stop(true).animate({right: '0px'}, duration, 'easeOutBack');
              $asidButton.find('img').attr('src', '/assets/btn_close.png');
// パイチャートの表示
              var NodeMyChart = document.querySelectorAll(".chart");
              var HashMyChart = Array.from(NodeMyChart);
              var count = 0;
              var IndexChart = "#myChart";

                HashMyChart.forEach(function(item,index){
                new Chart(document.querySelector(IndexChart+count), {
                type: "pie",
                data: {
                  labels: ["仕事", "私用", "その他"],
                  datasets: [
                    {
                      data: [300, 50, 100],
                      backgroundColor: [
                        "rgb(255, 99, 132)",
                        "rgb(54, 162, 235)",
                        "rgb(255, 205, 86)"
                      ]
                    }
                  ]
                }
              });
            count++;
            });

          }else{
              $aside.stop(true).animate({right: '-1200px'}, duration, 'easeInBack');
              $asidButton.find('img').attr('src', '/assets/btn_open.png');
          };
      });
  });


