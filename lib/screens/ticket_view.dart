import 'package:book_tickets/screens/search_screen.dart';
import 'package:book_tickets/services/ticket_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../utilitys/app_layout.dart';
import '../utilitys/app_styles.dart';

class TicketScreenView extends StatelessWidget {
  const TicketScreenView({super.key, this.ticket});
  final Map<String, dynamic>? ticket;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          padding: EdgeInsets.all(AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              'Tickets',
              style: Styles.headLineStyle1.copyWith(fontSize: AppLayout.getHeight(35)),
            ),
            Gap(AppLayout.getHeight(20)),
            SearchScreen.chooseBar(size, 'Upcoming', 'Previous'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Expanded(
                child: Row(
                  children: ticketList.map((singleTicket) => TicketScreenView(ticket: singleTicket)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
