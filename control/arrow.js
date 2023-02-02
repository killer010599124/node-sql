    // let arrow = document.querySelectorAll( ".sidebar .nav-links .arrow" );
    // let sidebar = document.querySelector(".sidebar");
    let submenus = document.querySelectorAll( ".sidebar .nav-links li" );

    for ( var i = 0; i < arrow.length; i++ ) {

        arrow[i].addEventListener("click", ( e ) => {
            
            e.preventDefault();
            
            let arrowParent = e.target.parentElement;//selecting parent li of arrow

            arrowParent.classList.toggle("active");

        });

    }


    sidebar.onmouseover=function(){

        sidebar.classList.remove('close');

    }

    sidebar.onmouseout=function(){

        sidebar.classList.add('close');

    }
     this.addEventListener('mousemove', function(e) {

            var sidebar_closed = sidebar.classList.contains( 'close' );

            if( sidebar_closed ) {

                for ( var i = 0; i < submenus.length; i++ ) {

                    submenus[i].classList.remove('active');
                }

            }

        });
    // window.onload = function() {

    //     this.addEventListener('mousemove', function(e) {

    //         var sidebar_closed = sidebar.classList.contains( 'close' );

    //         if( sidebar_closed ) {

    //             for ( var i = 0; i < submenus.length; i++ ) {

    //                 submenus[i].classList.remove('active');
    //             }

    //         }

    //     });

    // }