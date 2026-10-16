function validate()
      {
        var n = document.getElementById('name').value;
        var nREGEX = /^[a-zA-Z\s]{3,}$/
        var nResult = nREGEX.test(n);
        if(nResult == false)
        {
          alert('Please enter a valid name');

        }


        var phoneNumber = document.getElementById('phone').value;
        var phoneRGEX = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
        var phoneResult = phoneRGEX.test(phoneNumber);
        if(phoneResult == false)
        {
          alert('Please enter a valid phone number');
          return false;
        }


        var p = document.getElementById('pass').value;
        var pRGEX = /^([a-zA-Z$_0-9]){8,32}$/;
        var pResult = pRGEX.test(p);
        if(pResult == false)
        {
          alert('Please enter a valid password');
          return false;
        }


        var rep = document.getElementById('re-pass').value;
        if(rep != p)
        {
          alert('Password not matching');
          return false;
        }

        var m = document.getElementById('mail').value;
        var mRGEX = /^[a-zA-Z0-9_\.]{2,}@[a-zA-Z]+.[a-zA-Z]+$/;
        var mResult = mRGEX.test(m);
        if(mResult == false)
        {
          alert('Please enter a valid email');
          return false;
        }


      }
