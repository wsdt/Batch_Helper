/*!CK:613666410!*//*1403732240,*/

if (self.CavalryLogger) { CavalryLogger.start_js(["vxsWQ"]); }

__d("BirthdayReminder",["Animation","AsyncDialog","AsyncRequest","CelebrationsMarauderLogger","DOM","DOMQuery","Event","Parent","tx","XBirthdayMessagePostControllerURIBuilder"],function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p){var q=j.Events,r=j.Sources,s={registerMessageHandler:function(t,u,v){m.listen(t,'click',function(event,w){var x=(new i()).setURI('/ajax/messaging/composer.php').setData({ids:[u],ref:v}).setMethod('POST');h.send(x,function(y){y.subscribe('Messenger/message-sent',function(){var z=new p().getURI();new i().setURI(z).setData({id:u}).setMethod('POST').send();});});});},registerWallpostHandler:function(t,u,v){var w=null;if(v&&u)w=new j(r.RHC_REMINDER,u);m.listen(t,'submit',function(event,x){var y,z,aa;y=n.byTag(t,'li');if(y)for(z=y.nextSibling;z;z=z.nextSibling){aa=l.scry(z,'textarea');if(aa.length){aa[0].focus();break;}}if(w)w.logEvent(q.STARTED_SENDING_REQUEST);return true;});if(w)m.listen(t,'success',function(event,x){w.logEvent(q.FINISHED_SENDING_REQUEST);});m.listen(t,'error',function(event,x){k.setContent(t,"Beim Einsenden deines Beitrags ist ein Fehler aufgetreten.");if(w)w.logEvent(q.FAILED_SENDING_REQUEST);return false;});},registerCommentHandler:function(t,u){m.listen(t,'error',function(event,v){k.setContent(t,"Beim Einsenden deines Kommentars ist ein Fehler aufgetreten.");return false;});m.listen(t,'success',function(event,v){k.replace(t,u);new g(u).duration(1000).checkpoint().to('backgroundColor','#FFFFFF').from('borderColor','#FFE222').to('borderColor','#FFFFFF').go();});}};e.exports=s;},null);