

function setCookie(cokstr){
    document.cookie=cokstr;
}

function getCookie(){
    return document.cookie;
}

//滚动到屏幕顶端
function srollTOTop() {
    try {
        parent.scroll(0, 0);
    } catch (e) {
    }
}

//判断是否为无意义的空字符串
function isblank(inputVal)    {
        var str ;
        if(inputVal==null || inputVal=='')
            return true;
        str = inputVal.replace(' ','');
        while(str.indexOf(' ') > -1){
            str = str.replace(' ','');
        }
        str = str.replace('\t','');
        while(str.indexOf('\t') > -1){
            str = str.replace('\t','');
        }
        if(str == '')
            return true ;
        return false ;
}

//检查数字
function isNumberPublic(e){
    if(e.indexOf("e")!=-1||e.indexOf("E")!=-1){
        return false;
    }
    if(isNaN(e)){
        return false;
    }
    return true;
}
//检查整数,第一位允许是‘-’
function isIntegerPublic(e){
    for(i=0;i<e.length;i++){
        var oneChar=e.charAt(i);
        if(i==0&&oneChar=="-"){
            continue;
        }
        if(oneChar<'0'||oneChar>'9'){
            return false;
        }
    }
    return true;
}
//检查正整数
function isPosIntegerPublic(e){
    for(i=0;i<e.length;i++){
        var oneChar=e.charAt(i);
        if(oneChar<'0'||oneChar>'9'){
            return false;
        }
    }
    return true;
}

//检查手机号码
function checkPhoneNumberPublic(docFieldValue,checkfieldStr){

    if(checkfieldStr==""||checkfieldStr==null) checkfieldStr="手机号码";

    if((docFieldValue==null)||(docFieldValue=="")||(docFieldValue.length==0)||(docFieldValue=="请选择")){
        alert("请输入"+checkfieldStr+"！");
        return false;
    }else{
        if(isPosIntegerPublic(docFieldValue)==false){
            alert("请输入正确的"+checkfieldStr+"！");
            return false;
        }
        if(docFieldValue.indexOf(" ") != -1){
            alert(checkfieldStr+"中间不能有空格！");
            return false;
        }
        if(docFieldValue.replace(/[^\x00-\xff]/g,"aa").length != 11){
            alert(checkfieldStr+"必须为11位！");
            return false;
        }
    }
    return true;
}

//检查电子邮件
function checkEmailPublic(docFieldValue,checkfieldStr){

    if(checkfieldStr==""||checkfieldStr==null) checkfieldStr="E-MAIL";
    var myReg = /^\w+([.\-\+]\w+)*@\w+([.]\w+)*(\.\w+)$/;

    if(docFieldValue==null||docFieldValue==""){
        alert(checkfieldStr+"不能为空！");
        return false;
    }
    if(!myReg.test(docFieldValue)){
        alert("请输入正确的"+checkfieldStr+"地址！");
        return false;
    }
    return true;
}

//检查输入框长度
function checkTxtLenghtPublic(docFieldValue){
    var txtLenght = docFieldValue.replace(/[^\x00-\xff]/g,"aa").length;
    return txtLenght;
}

//检查非法字符
function checkIllegalCharPublic(docFieldValue,checkfieldStr,invalidCharset){

    if(invalidCharset==""||invalidCharset==null) invalidCharset="<>!?@#$%^&*|'+·￥\\\"\\\\ ";
    var myReg1=eval("/["+invalidCharset+"]/g");
    if(myReg1.test(docFieldValue)){
        alert(checkfieldStr+"请不要输入以下非法字符：" + invalidCharset);
        return false;
    }
    return true;
}

//检查身份证
/*
功能：检查日期格式是否有效；
输入：日期字符串；日期的格式(YYYY年,MM月,DD日,格式可以为YYYYMMDD,MM/DD/YYYY等)
输出：是true；否false；
*/

function isValidDatePublic(dateStr,format){
    var yearPos = format.indexOf("YYYY");
    var monthPos = format.indexOf("MM");
    var dayPos = format.indexOf("DD");

    if(dateStr.length != format.length){
        return false;
    }

    var year = dateStr.substring(yearPos,yearPos + 4);
    var month = dateStr.substring(monthPos,monthPos + 2);
    var day = dateStr.substring(dayPos,dayPos + 2);

    if(isNaN(year) || isNaN(month) || isNaN(day)){
        return false;
    }

    var dayNumOfMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

    if(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)){
        dayNumOfMonth[1]=29;
    }

    if(month < 1 || month > 12 || day >dayNumOfMonth[month -1] || day < 1 ){
        return false
    }
    else{
        return true;
    }

}


function CheckCredNumPublic(credNum,checkfieldStr){
    if(checkfieldStr==""||checkfieldStr==null) checkfieldStr="身份证";

    //身份证前17位从左到右的权值
    var weight =new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
    var sum = 0;
    var checkDigit ='X';

    //身份证长度检查
    if(credNum.length != 15 && credNum.length != 18){
        alert(checkfieldStr + "长度不正确");
        return false;
    }
    //15位身份证号码
    if(credNum.length == 15){
        //出生年月日的合法性
        if(isValidDatePublic("19" + credNum.substr(6,6),"YYYYMMDD")==false){
            alert(checkfieldStr + "中出生年月日输入错误，" + credNum.substr(6,6));
            return false;
        }
        if(isPosIntegerPublic(credNum)==false){
            alert("15位" + checkfieldStr + "必须全为数字！");
            return false;
        }
    }

    if(credNum.length==18){
        //前17位是否全为数字
        if(isPosIntegerPublic(credNum.substr(0,17))==false){
            alert("输入的18位" + checkfieldStr + "号前17位不全为数字!");
            return false;
        }

        //出生年月日的合法性
        if(!isValidDatePublic(credNum.substr(6,8),"YYYYMMDD")){
            alert(checkfieldStr + "中出生年月日输入错误，"+ credNum.substr(6,8));
            return false;
        }

        //计算校验位的值
        for(var i = 0; i < 17; i++){
            sum = sum + credNum.substr(i,1)*weight[i];
        }
        //求余数
        var mod = sum - Math.floor(sum/11)*11;

        switch(mod){
            case 0:	checkDigit = "1";break;
            case 1:	checkDigit = "0";break;
            case 2: checkDigit = "X";break;
            case 3:	checkDigit = "9";break;
            case 4: checkDigit = "8";break;
            case 5: checkDigit = "7";break;
            case 6:	checkDigit = "6";break;
            case 7: checkDigit = "5";break;
            case 8:	checkDigit = "4";break;
            case 9:	checkDigit = "3";break;
            case 10:checkDigit = "2";break;
        }

        if(credNum.substr(17,1) != checkDigit.toString()){
            alert(checkfieldStr + "输入错误!");
            return false;
        }
    }
    return true;
}//身份证校验完毕。

/* *
 用途：js中字符串超长作固定长度加省略号（...）处理
 参数说明：
    str:需要进行处理的字符串，可含汉字
    len:需要显示多少个汉字，两个英文字母相当于一个汉字。
 */
function beautySub(str, len) {
    var reg = /[\u4e00-\u9fa5]/g,    //专业匹配中文
        slice = str.substring(0, len),
        chineseCharNum = (~~(slice.match(reg) && slice.match(reg).length)),
        realen = slice.length * 2 - chineseCharNum;
    return str.substr(0, realen) + (realen < str.length ? "..." : "");
}