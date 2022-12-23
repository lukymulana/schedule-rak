<!-- Main Container -->
<main id="main-container">

<!-- Page Content -->
<div class="content">
    <!-- Bootstrap Design -->
    <h2 class="content-heading">Schedule</h2>
    
    <div class="col-md-12">
        <!-- Dynamic Table Full -->
        <div class="block">
            <div class="block-content block-content-full">
                <div id='calendar'></div>
                
                <!-- Add Data Actual Modal -->
                <div class="modal" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form action="<?php echo base_url('schedule/prosesSaveActual') ?>" method="post" enctype="multipart/form-data">
                            <div class="modal-content">
                                <div class="block block-themed block-transparent mb-0">
                                    <div class="block-header bg-primary-dark">
                                        <h3 class="block-title">Actual</h3>
                                        <div class="block-options">
                                            <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                                <i class="si si-close"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="block-content">
                                        <div class="form-group row"> 
                                            <input type="hidden" name="id_pm" id="id_pm" value="">
                                            <label class="col-12" for="tanggal_actual">Tanggal Actual</label>
                                            <div class="col-md-9">
                                                <div class="input-group control-group">
                                                    <input type="date" class="form-control" name="tanggal_actual" id="tanggal_actual" required>
                                                </div>
                                            </div>                                           
                                            <label class="col-12" for="jumlah_order">Shift</label>
                                            <div class="col-md-9">
                                                <div class="input-group control-group">
                                                    <select class="form-control" name="shift" id="shift">
                                                        <option value="" selected disabled>-- Pilih --</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>                            
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                                    <input class="btn btn-primary" type="submit" value="Submit" id="tombol-submit" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- END Add Data Actual Modal -->

                <!-- Add Actual Modal -->
                <div class="modal" id="modalData" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="block block-themed block-transparent mb-0">
                                <div class="block-header bg-primary-dark">
                                    <h3 class="block-title">Actual</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                            <i class="si si-close"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="block-content">
                                    <table>
                                        <tr>
                                            <th>Tanggal Actual</th>
                                            <th> : </th>
                                            <th><span id="show_actual_date"></span></th>
                                        </tr>
                                        <tr>
                                            <th>Shift</th>
                                            <th> : </th>
                                            <th><span id="show_shift"></span></th>
                                        </tr>
                                    </table>                          
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Close</button>
                                <!-- <button type="button" class="btn btn-primary" id="btn_edit">Edit</button> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Data Actual Modal -->

                <?php
                    // var_dump($schedule);
                    $data_pm = [];
                    $data_actual = [];
                    foreach ($schedule as $sh) {
                        $pm = [
                            "id" => $sh['id_pm'],
                            "title" => "PM",
                            "start" => $sh['start_date'],
                            "url" => "#",
                            "color" => "#e6cc27"
                        ];
                        array_push($data_pm, $pm);

                        if ($sh['actual_date'] != null) {
                            $actual = [
                                "id" => $sh['id_pm'],
                                "title" => "Actual",
                                "start" => $sh['actual_date'],
                                "url" => "#",
                                "color" => "#2d34fa" 
                            ];

                            array_push($data_actual, $actual);
                        }
                    }
                    $data = array_merge($data_pm, $data_actual);
                ?>

                <script>
                var arrayData = <?=json_encode($data); ?>;  
                console.log(arrayData);

                document.addEventListener('DOMContentLoaded', function() {
                    var calendarEl = document.getElementById('calendar');

                    var calendar = new FullCalendar.Calendar(calendarEl, {
                        initialView: 'dayGridMonth',
                        events: arrayData,
                        eventClick: function(arrayData) {
                            console.log(arrayData.event.id);
                            var id_pm = arrayData.event.id;
                            $.ajax({
                                type: "POST",
                                url: "<?=base_url(); ?>schedule/getDataPMById",
                                dataType: 'JSON',
                                data:{
                                    id_pm:id_pm
                                },
                                success: function(data)
                                {
                                    console.log(data);

                                    if (data[0].actual_date == null) {
                                        $("#id_pm").val(data[0].id_pm);
                                        $("#modalAdd").modal();
                                    } else {
                                        $("#show_actual_date").text(data[0].actual_date);
                                        $("#show_shift").text(data[0].shift);
                                        $("#modalData").modal();
                                        $("#btn_edit").click(function(){
                                            $("#modalData").modal('toggle');
                                            $("#id_pm").val(data[0].id_pm);
                                            $("#tanggal_actual").val(data[0].actual_date);
                                            $("#shift").val(data[0].shift).change();
                                            $("#modalAdd").modal();
                                        });
                                    }
                                }
                            });
                        },
                    });

                    calendar.render();
                    });

                </script>
            </div>
        </div>
        <!-- END Dynamic Table Full -->
    </div>
</div>
<!-- END Page Content -->
</main>
<!-- END Main Container -->