// // サイドバーの表示
$(document).on('click', '#open_close', function(){
  var duration = 600;
  var $aside = $('.taskbar');
  var $asidButton = $aside.find('#open_close')
      .on('click', function(){
          $aside.toggleClass('open');
          if($aside.hasClass('open')){
              $aside.stop(true).animate({right: '0px'}, duration, 'easeOutBack');
              $asidButton.find('img').attr('src', '/assets/btn_close.png');

// // タスクの種類を定義
              var Individual = 1;
              var Work = 1;
              var Others = 1;

// // パイチャート表示部分の要素を定義
              var NodeMyChart = document.querySelectorAll(".chart");
              var HashMyChart = Array.from(NodeMyChart);
              var IndexChart = "#myChart";

// //チャート作成・表示
              HashMyChart.forEach(function(item,index){

// // task-dataを読み取るまでの過程
              var list = document.querySelectorAll('.taskbar_piechart');
              var opt = list.item(index);
              var taskbar_total = opt.querySelectorAll('.taskbar_taskindex');
              var task_numbers = opt.children[0]; 
              var i = 0;
              while (i < taskbar_total.length){
                  var data_task = task_numbers.nextElementSibling.getAttribute('data-task');
                  task_numbers = task_numbers.nextSibling;
                  console.log(data_task);
                  i++;
              }
              new Chart(document.querySelector(IndexChart+index), {
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
            });
          }else{
              $aside.stop(true).animate({right: '-1200px'}, duration, 'easeInBack');
              $asidButton.find('img').attr('src', '/assets/btn_open.png');
          };
      });
  });