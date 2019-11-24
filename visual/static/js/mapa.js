(function() {
  
    var states = document.getElementsByClassName("estado")
    
    for(var i = 0; i < states.length; i++) {
      states[i].onclick = function(){
          alert('Partido com mais candidatos eleitos: '+this.getAttribute('name'));
          // document.getElementById(states[i].getAttribute('name')).innerHTML = document.getElementById(states[i].getAttribute('name')).innerHTML+' '+'PSDB';
      }
    }
  
  })();

  // (function() {
  
  //   var states = document.getElementsByClassName("estado")
    
  //   for(var i = 0; i < states.length; i++) {
  //       //   alert(this.getAttribute('name') + ' ' + document.getElementById(this.getAttribute('name')).innerHTML);

  //         document.getElementById(states[i].getAttribute('name')).innerHTML = document.getElementById(states[i].getAttribute('name')).innerHTML+' '+'PSDB';
  //   }
    
  
  // })();
