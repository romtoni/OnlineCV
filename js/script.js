function tampilkanProfile(id) {
    $.ajax({
        type: 'GET',
        url: 'api/profile.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {

            var nama = result["profile"][0]["name"];
            var tagline = result["profile"][0]["tagline"];
            var hp = result["profile"][0]["hp"];
            var email = result["profile"][0]["email"];
            var photo = result["profile"][0]["photo"];
            var umur = result["profile"][0]["age"];
            var tempat_lahir = result["profile"][0]["birth_place"];
            var tgl_lahir = result["profile"][0]["birth_date"];
            var alamat = result["profile"][0]["address"];
            var kota = result["profile"][0]["city"];
            var negara = result["profile"][0]["country"];

            var banner_name;
            var banner_contact;
            var profil;

            banner_name = `<h2>` + nama + `</h2>
                            <h4>` + tagline + `</h4>`;

            banner_contact = `<h5> HP: ` + hp + `</h5>
                                <h5> Email: ` + email + `</h5>`;

            profil = `<div class="row mt-3">
                                <div class="col text-center">
                                    <img src="` + photo + `" class="rounded-circle profile-picture" ><br>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col text-center">
                                        <p>` + umur + ` Tahun<br>` +
                tempat_lahir + `, ` + tgl_lahir + `<br>` +
                alamat + `, Kota ` + kota + `, ` + negara + `</p> 
                                </div> 
                            </div>`;

            $('#banner_name').html(banner_name);
            $('#banner_contact').html(banner_contact);
            $('#profil').html(profil);
            $('#id_separataor').html("<hr>");
        }

    });
}

function tampilkanSosialMedia(id) {
    $.ajax({
        type: 'GET',
        url: 'api/social_media.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var social_media = result["social_media"];
            var list_social_media = "";

            $.each(social_media, function (i, data) {
                list_social_media += `<div class="row mt-3">
                                        <div class="col text-justify ml-5">
                                             <img src="` + data.social_logo + `" class="social-image"> <a target="_blank" href="` + data.link + `">` + data.social_name + `</a> <br>
                                        </div>
                                    </div>`;

            });
            list_social_media += `<div class="row mt-3">
                                    <div class="col text-justify ml-5">&nbsp;<br></div>
                                </div>`;

            $('#social_media').html(list_social_media);

        }
    });
}

function tampilkanKeyExpertise(id) {
    $.ajax({
        type: 'GET',
        url: 'api/key_expertise.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var key_expertise = result["key_expertise"];
            var list_key_expertise = `<div class="row mt-4">
                                        <div class="col ml-4 title-expertise">Key Expertise</div>
                                    </div>`;

            $.each(key_expertise, function (i, data) {
                list_key_expertise += `<div class="row">
                                            <div class="col">
                                                <ul class="list-group ">
                                                    <li class="list-group-item text-white list-expertise">
                                                        <span class="subtitle-expertise">` + data.title + `</span><br>` +
                    data.descriptions + `</li>
                                                </ul>
                                            </div>
                                        </div>`;

            });

            $('#key_expertise').html(list_key_expertise);

        }
    });
}

function tampilkanKarirProfesional(id) {
    $.ajax({
        type: 'GET',
        url: 'api/professional_career.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var professional_career = result["professional_career"];
            var list_professional_career = `<div class="row mt-4">
                                                <div class="col"><span class="title-others">Karir Profesional </span></div>
                                            </div>`;

            $.each(professional_career, function (i, data) {
                if (data.end_date === null) var periode = data.start_date + " s/d Sekarang";
                else var periode = data.start_date + " s/d " + data.end_date;

                list_professional_career += `<div class="row">
                                                <div class="col-md-8 text-justify">
                                                    <p><span class="subtitle-others">` + data.company + `, ` + periode + `</span> <br>
                                                        ` + data.position + `<br>
                                                        <span class="content-others">` + data.jobdesc + `</span></p>
                                                </div>
                                                <div class="col-md-4">
                                                    <img src="` + data.company_logo + `" alt="` + data.company + `" class="logo-image">
                                                </div>
                                            </div>`;

            });

            $('#professional_career').html(list_professional_career);

        }
    });
}

function tampilkanKualifikasiAkademi(id) {
    $.ajax({
        type: 'GET',
        url: 'api/academic_qualification.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var academic_qualification = result["academic_qualification"];
            var list_academic_qualification = `<div class="row mt-3">
                                                    <div class="col"><span class="title-others">Kualifikasi Akademik</span></div>
                                                </div>`;

            $.each(academic_qualification, function (i, data) {

                if (data.title === null && data.gpa === null) var data_detail = data.department;
                else var data_detail = data.title + ", " + data.department + " (" + data.gpa + ")";

                list_academic_qualification += ` <div class="row">
                                                    <div class="col-md-8 text-justify">
                                                        <ul class="list-group ml-3 ">
                                                            <li><span class="subtitle-others">` + data.name + `, ` + data.city + `, ` + data.country + `<br> Periode Akademik : ` + data.start_date + ` - ` + data.end_date + `</span> <br>
                                                            ` + data_detail + `</li>
                                                        </ul>
                                                    </div>
                                                </div>`;

            });

            $('#academic_qualification').html(list_academic_qualification);

        }
    });
}

function tampilkanKursus(id) {
    $.ajax({
        type: 'GET',
        url: 'api/course.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var course = result["course"];
            var list_course = `<div class="row mt-3">
                                    <div class="col"><span class="title-others">Kursus dan Seminar</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8 text-justify">
                                        <ul class="list-group ml-3 ">`;

            $.each(course, function (i, data) {
                list_course += `<li>` + data.name + `, ` + data.company + `, ` + data.city + `, ` + data.country + `, ` + data.start_date + `</li>`;

            });

            list_course += `        </ul>
                                </div>
                            </div>`;
            $('#course').html(list_course);

        }
    });
}

function tampilkanPerangkatLunak(id) {
    $.ajax({
        type: 'GET',
        url: 'api/software.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var software = result["software"];
            var list_software = ` <div class = "row mt-3">
                                        <div class = "col"> <span class = "title-others"> Perangkat Lunak</span></div>
                                    </div>
                                <div class = "row">
                                        <div class = "col-md-8 text-justify mt-2"> `;

            $.each(software, function (i, data) {
                list_software += ` <img src = "` + data.icon + `"
            class = "rounded float-left mr-1 software-image"
            alt = "` + data.name + `" > `;
            });

            list_software += ` </div> </div > `;
            $('#software').html(list_software);
        }
    });
}

function tampilkanKeahlian(id) {
    $.ajax({
        type: 'GET',
        url: 'api/skillset.php',
        data: {
            'id_profile': id
        },
        dataType: 'json',
        success: function (result) {
            var skillset = result["skillset"];

            var list_skillset = `<div class = "row mt-3 " >
                                    <div class = "col"> <span class = "title-others"> Keahlian </span></div>
                                </div> 
                                <div class = "row mb-3">
                                    <div class = "col-md-8 text-justify">
                                        <ul class = "list-group ml-3 ">`;

            $.each(skillset, function (i, data) {

                if (data.additional_info === null) var detail = ``;
                else var detail = `(` + data.additional_info + `)`;
                list_skillset += `<li>` + data.name + ` ` + detail + `</li>`;
            });

            list_skillset += `          </ul> 
                                    </div> 
                                </div>`;
            $('#skillset').html(list_skillset);
        }
    });
}

tampilkanProfile(1);
tampilkanKeyExpertise(1);
tampilkanSosialMedia(1);
tampilkanKarirProfesional(1);
tampilkanKualifikasiAkademi(1);
tampilkanKursus(1);
tampilkanPerangkatLunak(1);
tampilkanKeahlian(1);