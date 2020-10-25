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

// // パイチャート表示部分の要素を定義
              var NodeMyChart = document.querySelectorAll(".chart");
              var HashMyChart = Array.from(NodeMyChart);
              var IndexChart = "#myChart";

// //チャート作成・表示
              HashMyChart.forEach(function(item,index){

// // task-dataを読み取るまでの過程
              var list = document.querySelectorAll('.taskbar_piechart');
              var opt = list.item(index);
              var task_numbers = opt.children[0];

              var taskbar_total = opt.querySelectorAll('.taskbar_taskindex');//処理の回数を取得するため
              var i = 0

              var Individual = 0;
              var Work = 0;
              var Others = 0;

              while (i < taskbar_total.length){
                //タスクデータを取得するまで
                  var data_task = task_numbers.nextElementSibling.getAttribute('data-task');
                  task_numbers = task_numbers.nextElementSibling;

                  //kindでーたを取得するところまで
                  var kind_numbers = opt.children[i+1]; 
                  var data_kind = kind_numbers.lastElementChild.textContent;
                  kind_numbers = kind_numbers.nextElementSibling;

                  //ここからスイッチ文
                  switch(data_kind.trim()){

                    case "私用":
                      Individual += parseFloat(data_task);
                      break;

                    case "仕事":
                      Work += parseFloat(data_task);
                      break;

                    case "その他":
                      Others += parseFloat(data_task);
                      break;

                    default:
                      break;
                  }
                  i++;
              }
              new Chart(document.querySelector(IndexChart+index), {
                type: "pie",
                data: {
                  labels: ["私用", "仕事", "その他"],
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
              console.log(Individual);
              console.log(Work);
              console.log(Others);
            });
          }else{
              $aside.stop(true).animate({right: '-1200px'}, duration, 'easeInBack');
              $asidButton.find('img').attr('src', '/assets/btn_open.png');
          };
      });
  });