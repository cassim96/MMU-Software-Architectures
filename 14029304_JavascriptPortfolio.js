for (var i=0; i <5; i++){
 fleet[i] = new Taxi(i);
}
for ( var i = 0; i < fleet.length; i++){
 print("Taxi with badge number " + fleet[i].badgeNumber +
" is " + fleet[i].color);
}
fleet.map((itm) => itm.color = "white");
for ( var i = 0; i < fleet.length; i++){
 print("Taxi with badge number " + fleet[i].badgeNumber +
" is " + fleet[i].color);
 fleet[i].blowHorn()
}
