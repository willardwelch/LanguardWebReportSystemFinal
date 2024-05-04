function dms2deg(s) {

    // Determine if south latitude or west longitude
    var sw = /[sw-]/i.test(s);

    // Determine sign based on sw (south or west is -ve) 
    var f = sw ? -1 : 1;

    // Get into numeric parts
    var bits = s.match(/[\d.]+/g);

    var result = 0;

    // Convert to decimal degrees
    for (var i = 0, iLen = bits.length; i < iLen; i++) {

        // String conversion to number is done by division
        // To be explicit (not necessary), use 
        //   result += Number(bits[i])/f
        result += bits[i] / f;

        // Divide degrees by +/- 1, min by +/- 60, sec by +/-3600
        f *= 60;
    }

//alert(
//  dms2deg('S 023 30\'') + '\n' +      // -23.5
//  dms2deg('N 023 00\' 00\"') + '\n' + //  23
//  dms2deg('W 117 23\' 23.32\"')       // -117.3898111111111
//);

    return result;



}
