document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let c = canvas.getContext('2d');
  c.fillStyle = 'red';
  c.fillRect(0,0,180,110);
  c.fillStyle = '#002d62';
  c.fillRect(220,0,180,110);
  c.fillStyle = 'red';
  c.fillRect(220,150,180,110);
  c.fillStyle = '#002d62';
  c.fillRect(0,150,180,110);

  c.beginPath();
  c.arc(200, 130, 15, 0, 2 * Math.PI);
  c.fillStyle = '#007b64';
  c.strokeStyle = 'green';
  c.stroke();
  c.fill();
});
