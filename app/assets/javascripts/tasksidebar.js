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

// タスクの種類を定義
              var Individual = 50;
              var Work = 20;
              var Others = 80;

// task-dataを読み取るまでの過程
              var list = document.querySelectorAll('.taskbar_piechart_index')
              var opts = list;
              for (var i = 0, len = opts.length; i < len; i++){
                var opt = opts.item(i);
                if (opt.nodeType === 1){


                  var test = opt.nextSibling; //optsと一緒

                  console.log(test);
                  var test2 = test.nextElementSibling;
                  console.log(test2);
                }
              }

// パイチャート表示部分の要素を定義
              var NodeMyChart = document.querySelectorAll(".chart");
              var HashMyChart = Array.from(NodeMyChart);
              var count = 0;
              var IndexChart = "#myChart";

//チャート作成・表示
              HashMyChart.forEach(function(item,index){
                // ここにIndexChart+countでdata代入
              Individual;
              Work;
              Others;
              new Chart(document.querySelector(IndexChart+count), {
                type: "pie",
                data: {
                  labels: ["仕事", "私用", "その他"],
                  datasets: [
                    {
                      data: [Individual, Work, Others],
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