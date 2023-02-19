import 'dart:convert';

import 'package:cathering_mobile/core/utils/config.dart';
import 'package:cathering_mobile/features/beranda/presentation/bloc/paket_bloc.dart';
import 'package:cathering_mobile/features/beranda/presentation/widgets/paket_container_widget.dart';
import 'package:cathering_mobile/features/login/data/models/login_model.dart';
import 'package:cathering_mobile/features/login/domain/entities/login.dart';
import 'package:cathering_mobile/injection_container.dart';
import 'package:cathering_mobile/widgets/custom_shimmer_widget.dart';
import 'package:cathering_mobile/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BerandaView extends StatelessWidget {
  const BerandaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaketBloc>()..add(GetPaketEvent()),
      child: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final prefs = sl<SharedPreferences>();
  late Login user;

  @override
  void initState() {
    user = LoginModel.fromJson(jsonDecode(prefs.getString(LOGIN_DATA_KEY)!));
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(16.w, 45.h, 16.w, 30.h),
        children: [
          CustomTextWidget(
            text: 'Makan apa Hari ini...?',
            size: 18.sp,
            weight: FontWeight.w800,
          ),
          SizedBox(height: 24.h,),
          BlocBuilder<PaketBloc, PaketState>(
            builder: (context, state) {
              if (state is PaketLoaded) {
                return SizedBox(
                  height: 32.h,
                  width: 1.sw,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PaketContainerWidget(
                        isActive: state.paket[index].isActive,
                        namaPaket: state.paket[index].namaPaket,
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(width: 8.w,),
                    itemCount: state.paket.length,
                  ),
                );
              } else if (state is PaketFailed){
                return CustomTextWidget(text: state.errorModel.message);
              } else {
                return SizedBox(
                  height: 24.h,
                  width: 1.sw,
                  child: CustomShimmerWidget(
                    itemCount: 5, 
                    itemBuilder: const PaketContainerWidget(
                      namaPaket: 'nama',
                      isActive: false,
                    ), 
                    separateWidget: SizedBox(width: 8.w,)
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  String greetings() {
    final time = DateTime.now().hour;
    if (time > 3 && time <=10) {
      return 'Selamat Pagi,';
    } else if(time > 10 && time <= 15) {
      return 'Selamat Siang,';
    } else if(time > 15 && time <= 19) {
      return 'Selamat Sore,';
    } else {
      return 'Selamat Malam,';
    }
  }
}