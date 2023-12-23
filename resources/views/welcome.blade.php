<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bus Reservation System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('asset/style.css') }}">
</head>

<body>
    <div class="container">
        <h2 class="py-3 text-center">Bus Reservation Form</h2>
        <form action="{{ route('reserve') }}" method="POST">
            @csrf
            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="formGroupExampleInput">Name</label>
                        <input type="text" class="form-control" name="name" id="formGroupExampleInput"
                            placeholder="Example input">
                    </div>
                    <div class="form-group">
                        <label for="formGroupExampleInput2">Mobile</label>
                        <input type="text" class="form-control" name="mobile" id="formGroupExampleInput2"
                            placeholder="Another input">
                    </div>
                    <div class="form-row">
                        <div class="form-group  col">
                            <label for="">From</label>

                            <select class="form-control" name="from">
                                @php
                                    $loc = App\Models\Location::all();
                                @endphp
                                @foreach ($loc as $item)
                                    <option value="{{ $item->name }}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group  col">
                        <label for="">To</label>

                            <select class="form-control" name="to">
                                @foreach ($loc as $item)
                                    <option value="{{ $item->name }}">{{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="">Date</label>
                        <input type="date" class="form-control" name="date" id=""
                            placeholder="Another input">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="seat-plan-inner d-none">
                        <div class="single">
                            <input type="hidden" name="alloc[]" value="">

                            <span class="front">Front</span>
                            <span class="rear">Rear</span>

                            <span class="lower">Door</span>
                            <span class="driver"><img
                                    src="https://script.viserlab.com/viserbus/assets/templates/basic/images/icon/wheel.svg"
                                    alt="icon"></span>

                                    @for ($i = 1; $i <= 36; $i++)
                            <div class="seat-wrapper">
                                    <div class="left-side">
                                        <div>
                                            <span class="seat" data-seat="{{ $i }}">
                                                {{ $i }}
                                                <span></span>
                                            </span>
                                        </div>
                                        <div>
                                            <span class="seat" data-seat="{{ ++$i }}">
                                                {{ $i }}
                                                <span></span>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="right-side">
                                        <div>
                                            <span class="seat" data-seat="{{ ++$i }}">
                                                {{ $i }}
                                                <span></span>
                                            </span>
                                        </div>
                                        <div>
                                            <span class="seat" data-seat="{{ ++$i }}">
                                                {{ $i }}
                                                <span></span>
                                            </span>
                                        </div>
                                    </div>


                                </div>
                                @endfor


                        </div>
                    </div>
                    <button type="submit">Submit</button>
                </div>
            </div>
        </form>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
    <script>
        var alloc = $('input[name="alloc[]"]').val().split(',');
        var seat=[];
        alloc.forEach(element => {
                seat.push(Number(element));
        });


        $(document).ready(function() {
            $('.seat').click(function() {
                var id=$(this).data('seat');
                if(!seat.find(x=>x==id)){
                    seat.push(id);

                }
                //set background color
                $(this).toggleClass('active');


            });

            $('button[type="submit"]').click(function(){
                $('input[name="alloc[]"]').val(seat);
            });

        });

        $(document).ready(function($) {
            var $form = $('form');
             $.ajax({
                type:"GET",
                url:"{{ route('getseat') }}",
                success:function(data){

                    var seat=data.toString().split(',');
                    if(seat.length>0){
                        $('.seat-plan-inner').removeClass('d-none');
                    }
                    var alloc=[];
                    seat.forEach(element => {
                        $('.seat').each(function(){
                            if($(this).data('seat')==element){
                                $(this).addClass('disable');
                                $(this).off('click');
                                alloc.push(Number(element));
                            }
                        });
                    });

                    $('input[name="alloc[]"]').val(alloc);

                }
             })
        });
    </script>
</body>

</html>
