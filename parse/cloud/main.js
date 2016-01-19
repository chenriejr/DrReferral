
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("averageStars", function(request, response) {
  var query = new Parse.Query("Review");
  query.equalTo("movie", request.params.movie);
  query.find({
    success: function(results) {
      var sum = 0;
      for (var i = 0; i < results.length; ++i) {
        sum += results[i].get("stars");
      }
      response.success(sum / results.length);
    },
    error: function() {
      response.error("movie lookup failed");
    }
  });
});

Parse.Cloud.define("sendMail", function(request, response) {
var Mailgun = require('mailgun');
Mailgun.initialize('mg.aisleup.com','key-74fa2045f94e344ad1fdec438024a1e9');
  Mailgun.sendEmail({
  to:  request.params.toEmail,
  from: request.params.fromEmail,
  subject: request.params.subject,
  text:request.params.text
}, {
  success: function(httpResponse) {
    console.log(httpResponse);
    response.success("Email sent!");
  },
  error: function(httpResponse) {
    console.error(httpResponse);
    response.error("Uh oh, something went wrong");
  }
});
});
Parse.Cloud.afterSave(Parse.Referral, function(request) {

    if(!(request.object.existed())){
       var Mailgun = require('mailgun');
       Mailgun.initialize('mg.aisleup.com','key-74fa2045f94e344ad1fdec438024a1e9');

       Mailgun.sendEmail({
       to:  request.params.toEmail,
       from: request.params.fromEmail,
       subject: request.params.subject,
       text:request.params.text
        }, {
        success: function(httpResponse) {
             console.log(httpResponse);
          },
          error: function(httpResponse) {
             console.error(httpResponse);
          }
      });
    }
});


//Mailgun.sendEmail({
//message: {
//text: request.params.text,
//subject: request.params.subject,
//from_email: request.params.fromEmail,
//from_name: request.params.fromName,
//to: [
//{
//email: request.params.toEmail,
//name: request.params.toName
//}
//]
//},
//async: true
//},{
//success: function(httpResponse) {
//console.log(httpResponse);
//response.success("Email sent!");
//},
//error: function(httpResponse) {
//console.error(httpResponse);
//response.error("Uh oh, something went wrong");
//}
//});
//});

//Mailgun.sendEmail({
//  to:  request.params.toEmail,
//  from: request.params.fromEmail,
//  subject: request.params.subject,
//  text:request.params.text
//}, {
//  success: function(httpResponse) {
//    console.log(httpResponse);
//    response.success("Email sent!");
//  },
//  error: function(httpResponse) {
//    console.error(httpResponse);
//    response.error("Uh oh, something went wrong");
//  }
//});
//    });