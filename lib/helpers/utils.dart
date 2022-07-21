// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:c300drowningdetection/helpers/appcolors.dart';
import 'package:c300drowningdetection/helpers/iconhelper.dart';
import 'package:c300drowningdetection/models/mainlocation.dart';
import 'package:c300drowningdetection/models/sublocation.dart';
import 'package:flutter/material.dart';

class Utils {
  static List<MainLocation> getLocations() {
    return [
      MainLocation(
          color: Colors.red,
          name: "North",
          imgName: "ComingSoon",
          direction: "North",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.red,
                name: "Woodlands",
                imgName: "Woodlands",
                direction: "3 Woodlands Street 13\nSingapore 738600",
                icon: IconFontHelper.MORE_DOTS,
                description:
                    "Woodlands Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWoodlands Spot Centre, formerly known as Woodlands Sport and Recreation Centre, operates in a mature estate, serving its community with its well managed and upgraded facilities. It has attracted a sizable following among the residents in the community, and is able to tap on the Woodlands regional centre to offer it an alternative segment for further growth.\n\nWoodlands Sport Centre has introduced Aqua Aerobics at its Swimming Complex, and will continue to expand its programme offerings at its facilities to expand its market segment.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                subLocation: [],
              long: 103.77953147513655,
              lat: 1.434430293831611,
            ),
            SubLocation(
                color: Colors.red,
                name: "Yishun",
                imgName: "Yishun",
                direction: "351 Yishun Avenue 3\nSingapore 769057",
                icon: IconFontHelper.MORE_DOTS,
                description:
                    "Yishun swimming complex is a public swimming complex managed by Sport Singapore.\n\nYishun Sport Centre, formerly known as Yishun Sport and Recreation Centre, can be looked upon as two separate satellite centres, with the Swimming Complex located approximately three bus stops away from the Sport Hall and Stadium. Yishun manage its facilities effectively, allowing it to deliver consistent service standards, and attract a good following for its gyms, and sports programmes.\n\nYishun Sport Centre will continue to serve the community in the North by offering a well managed facility while expanding its programme offerings to appeal to different segments of the market.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                subLocation: [],
              long: 103.83409281006826,
              lat: 1.4240208115155686,
            ),
          ]),
      MainLocation(
          color: Colors.purple,
          name: "North-East",
          imgName: "ComingSoon",
          direction: "North-East",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.purple,
                name: "Ang Mo Kio",
                imgName: "AngMoKio",
                direction: "1771 Ang Mo Kio Avenue 1\nSingapore 569978",
                description:
                    "Ang Mo Kio Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nBackground: Opened to the public on 24 May 1982.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading po",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.849917130967,
              lat: 1.3632900895496858,
            ),
            SubLocation(
                color: Colors.purple,
                name: "Hougang",
                imgName: "Hougang",
                direction: "95 Hougang Avenue 4\nSingapore 538830",
                description:
                    "Hougang Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nFacility Information: 1 competition pool, 1 teaching pool, 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.88727823559782,
              lat:  1.369990850871825,
            ),
            SubLocation(
                color: Colors.purple,
                name: "Sengkang",
                imgName: "Sengkang",
                direction: "57 Anchorvale Road\nSingapore 544964",
                description:
                    "Sengkang Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nSengkang Sport Centre, formerly known as Sengkang Sport and Recreation Centre, is co-located with the People’s Association Anchorvale Community Club, and offers one of the two sheltered pool managed by Sport Singapore. Sengkang has established itself as a world class venue for hockey, with significant facility upgrades being undertaken for the inaugural Youth Olympic Games (2010).\n\nSengkang Sport Centre is located within a young estate. The attention will be to engage the local community, and to develop programmes which appeals to their needs\n\nFacility Information: Sheltered pool available, swimming pool wheelchair available",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.88629597593611,
              lat: 1.396355233165806,
            ),
            SubLocation(
                color: Colors.purple,
                name: "Yio Chu Kang",
                imgName: "YioChuKang",
                direction: "202 Ang Mo Kio Avenue 9\nSingapore 5699771",
                description:
                    "Yio Chu Kang Swimming Complex is one of the swimming pools located in the North-East Region of Singapore. It is managed by Sport Singapore.\n\nIt is just a short 5 minutes walks from Yio Chu Kang MRT if you take a shortcut via the pathAway beside Pat's Schoolhouse Grassroots' Club.\n\nThis Swimming Complex has been around to serve the residents of the vicinity for a long time and it has become a favourite venue for regular swimmers.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.84657984610516,
              lat: 1.3817754954545938,
            ),
          ]),
      MainLocation(
          color: Colors.green,
          name: "East",
          imgName: "ComingSoon",
          direction: "East",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.green,
                name: "Delta",
                imgName: "Delta",
                direction: "900 Tiong Bahru Road\nSingapore 158790",
                description:
                    "Delta swimming complex is a public swimming complex operated by Sport Singapore. Opened to the public on 7 Nov 79\n\nDelta Sport Centre, formerly known as Delta Sport and Recreation Centre, operates in a mature residential estate. Its central location and proximity to central business district makes it a draw with white collar workers. Besides serving the community sporting needs, it has contributed to the local development of hockey through its accessible and quality hockey pitch.\n\nDelta Sport Centre continues to meet the current needs of the community, and is striving to extend its reach to the wider population through introducing new sports programmes and rejuvenation of its facilities.\n\nFacility Information: 1 competition pool, 1 teaching pool, 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.81973540705928,
              lat: 1.2892344328616048,
            ),
            SubLocation(
                color: Colors.green,
                name: "Bedok ActiveSG",
                imgName: "Bedok",
                direction: "11 Bedok North Street 1\nSingapore 469662",
                description:
                    "Heartbeat @ Bedok ActiveSG Swimming Complex is a public swimming complex managed by Sport Singapore. Located at the new Integrated Complex in Bedok North, the facility opened on 1 August 2017.\n\nFacility Information: 1 competition pool, 1 sheltered training pool, 1 learner pool, 1 interactive pool, Seating Gallery, Swimming pool wheelchair available",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.9322438837943,
              lat: 1.3272346640139023,
            ),
            SubLocation(
                color: Colors.green,
                name: "Pasir Ris",
                imgName: "PasirRis",
                direction: "120 Pasir Ris Central\nSingapore 519640",
                description:
                    "Pasir Ris Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nPasir Ris Sport Centre, formerly known as Paris Ris Sport and Recreation Centre, Sport Singapore’s newest addition to its family of sport centres, features a comprehensive range of sport facilities with a diverse retail mix to provide an all rounded experience for guests.\n\nPasir Ris Sport Centre has also been awarded BCA 1000th Green Mark award – Gold Plus is designed with environmentally friendly and energy-saving features such as a rainwater-harvesting system to irrigate surrounding plants, vertical ‘green’ walls and landscaping to reduce ambient heat gained, and photo-voltaic cells for energy generation.\n\nFacility Information: 1 competition pool, 1 teaching pool, 2 slides, 1 catchment pool, 1 wading pool, 1 jacuzzi and swimming pool wheelchair available",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long:  103.95212643521916,
              lat: 1.3743832904841113,
            ),
            SubLocation(
                color: Colors.green,
                name: "Tampines",
                imgName: "Tampines",
                direction: "1, Our Tampines Hub, Tampines Walk\nSingapore 528523",
                description:
                    "Tampines Swimming Complex has been relocated to Our Tampines Hub Level 6.\n\nTampines has undergone significant upgrades for its swimming complex, and continues to provide value for money recreational activities for its community. Looking ahead, its current positioning will favour it to tap into the emerging trend of lifestyle services.\n\nFacility Information: 1 competition pool, 1 training pool, 1 multi-purpose pool, 1 interactive pool, 1 wading pool and swimming pool wheelchair available",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.94033729475593,
              lat: 1.3530764934902768,
            ),
          ]),
      MainLocation(
          color: Colors.lightGreen,
          name: "West",
          imgName: "ComingSoon",
          direction: "West",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: Colors.lightGreen,
                name: "Bukit Batok",
                imgName: "BukitBatok",
                direction: "2 Bukit Batok Street 22\nSingapore 659581",
                description:
                    "Bukit Batok Swimming Complex offers a pleasant environment for which leisure swimmers can take a leisure away from the hustle and bustle of the city. This facility is also popular with schools for swimming lessons.\n\nFacility Information: 1 competition pool, 1 wading pool, 1 teaching pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.7486073381792,
              lat: 1.3446482024624324,
            ),
            SubLocation(
                color: Colors.lightGreen,
                name: "Choa Chu Kang",
                imgName: "ChoaChuKang",
                direction: "1 Choa Chu Kang Street 53\nSingapore 689236",
                description:
                    "Choa Chu Kang Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nIt is located in Choa Chu Kang Sports Centre.\n\nSince 2001, Choa Chu Kang Sport Centre, formerly known as Choa Chua Kang Sport and Recreation Centre, has brought new levels of excitement for the young and young at heart with its integrated facilities. In addition to being home to the S-League powerhouse SAF Warriors, the stadium plays host to annual inter-school athletics meets.\n\nSituated between 2 MRT stations, Choa Chu Kang Sport Centre has positioned itself as the location of choice for its sports and recreational activities for residents nearby.\n\nFacility Information: 1 competition pool, 1 wave pool, 1 wading pool, 1 slide and 1 SPA pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.74827477545645,
              lat: 1.3911713449646292,
            ),
            SubLocation(
                color: Colors.lightGreen,
                name: "Clementi",
                imgName: "Clementi",
                direction: "520 Clementi Avenue 3\nSingapore 129908",
                description:
                    "Clementi Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nWith a busy interchange and train station nearby, Clementi Sport Centre, formerly known as Clementi Sport and Recreation Centre, serves a mature estate with people of different ages, from kids, young adults, to the active seniors.\n\nClementi is the preferred venue for Ministry of Education's basketball championships and is training ground for our Singapore fencing team.\n\nThough it is one of the oldest facility, Clementi has been able to re-invent itself through bringing amateur boxing to the masses to revive the interest of the working adults.\n\nFacility Information: 1 competition pool, 1 teaching pool, 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.76564696304602,
              lat: 1.3108197488656343,
            ),
            SubLocation(
                color: Colors.lightGreen,
                name: "Jurong East",
                imgName: "JurongEast",
                direction: "21 Jurong East Street 31\nSingapore 609517",
                description:
                    "Jurong East Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nBeing the first one-stop integrated centre, Jurong East Sport Centre, formerly known as Jurong East Sport and Recreation Centre, marks a milestone in Sport Singapore’s facilities development when it opened in 2000. It was the first pool to offer a lazy river, wave pool and fun slides to the masses at an affordable rate.\n\nWith its other facilities like air-conditioned sport hall, stadium, fitness gym, Jurong East Sport Centre prides itself as a preferred venue for community events, tournaments and a leisure day out for all.\n\nFacility Information: 1 competition pool, 1 wave pool, 1 lazy river, 1 kiddy pool, 1 jacuzzi, 3 water slides",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.7286408808192,
              lat: 1.3467637079354224,
            ),
            SubLocation(
                color: Colors.lightGreen,
                name: "Jurong Lake Gardens",
                imgName: "JurongLakeGardens",
                direction: "30 Yuan Ching Road\nSingapore 618664",
                description:
                    "Jurong Lake Garden was formerly a private club before it hand over to Sport Singapore and open to public in April 2019.\n\nJurong Lake Gardens is Singapore's new national gardens in the heartlands. It is a people's garden, where spaces will be landscaped and created for families and the community to come together and enjoy the nature. The 90-hectare Gardens comprises Lakeside Garden (formerly Jurong Lake Gardens West), Chinese and Japanese Gardens (formerly Jurong Lake Gardens Central) and Garden Promenade (formerly Jurong Lake Gardens East). If you like the swimming pool close to nature, this is the pool you should try.",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.72558649985692,
              lat: 1.3303962503354487,
            ),
            SubLocation(
                color: Colors.lightGreen,
                name: "Jurong West",
                imgName: "JurongWest",
                direction: "20 Jurong West Street 93\nSingapore 648965",
                description:
                    "Jurong West Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nAs the 3rd integrated facility with pool features, Jurong West Sport Centre, formerly known as Jurong West Sport and Recreation Centre, has raised the benchmark for all swimming pools in 2006. With close proximity to the Pioneer MRT station, it has been able to position itself to be a sports and leisure venue.\n\nMore than just being a choice venue for sports activities, Jurong West Sport Centre offers a range of food and beverage outlets with ample sheltered parking lots.\n\nFacility Information: Swimming pool wheelchair available",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.69337431642461,
              lat: 1.338016946399475,
            ),
            SubLocation(
                color: Colors.lightGreen,
                name: "Senja-Cashew",
                imgName: "Senja-Cashew",
                direction: "101 Bukit Panjang Road\nSingapore 679910",
                description:
                    "Learn to Swim at Senja Cashew Swimming Complex with certified and experienced coaches. Swimming lessons such as toddler swimming class, children swimming class and adult swimming class are available here.\n\nThis lovely swimming complex is ideal for families, children and individuals, is well maintained and managed and offers a wide range of swimming activities.  Children swimming lessons at Senja Cashew are of the highest standard, and the learning pool is always clear, bright and inviting.  There are also swimming lessons at Senja Cashew for adults, meaning it is never too late for you to learn.\n\nThe instructors at the Senja Cashew Swimming Complex are excellent and offer classes of the highest standard.  If you enjoy swimming and Singapore sunshine, and want to keep the kids and family bus for a while, the Senja Cashew Swimming complex is a lovely place to hang out, with excellent facilities.\n\nFacility Information: 1 competition pool, 1 wading pool, 1 jacuzzi",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.76459143902355,
              lat: 1.3820195602281908,
            ),
          ]),
      MainLocation(
          color: AppColors.MAIN_COLOR,
          name: "Central",
          imgName: "ComingSoon",
          direction: "Central",
          icon: IconFontHelper.MORE_DOTS,
          subCategories: [
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Bishan",
                imgName: "Bishan",
                direction: "1 Bishan Street 14\nSingapore 579778",
                description:
                    "Bishan Swimming Complex is located within the larger Bishan Sports Complex in the heart of Singapore. With a backdrop of nearby luxurious condominiums, the Bishan Swimming Complex offers three pools for the residents. The wading pool is suitable for toddlers and young children; the training pool is used as a teaching pool for those learning to swim and the competition pool caters to the competent swimmers who visit the complex.\n\nThe Bishan swimming complex is ideal for a day’s out with the children since it offers up more than just water fun. After swimming, you can also pop by the other facilities within the Bishan Sports Complex for more fun and games.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.85014609069577,
              lat: 1.35429504525964,
            ),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Geylang East",
                imgName: "GeylangEast",
                direction: "601 Aljunied Avenue 1\nSingapore 389862",
                description:
                    "Geylang East Swimming Complex is one of the swimming pools located in the Central Region of Singapore. It is managed by Sport Singapore, is a comprehensive swimming facility that has a convenient location – certainly a crowd favourite for the residents in the vicinity.\n\nSurrounded by great food spots and lifestyle options, visitors can always consider Geylang East Swimming Complex if they are interested in taking up swimming lessons.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool.",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.88784453672035,
              lat: 1.32133149227945,
            ),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Jalan Besar",
                imgName: "JalanBesar",
                direction: "100 Tyrwhitt Road\nSingapore 207542",
                description:
                    "Jalan Besar Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.85970216030182,
              lat: 1.3102704760381039,
            ),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Katong",
                imgName: "Katong",
                direction: "111 Wilkinson Road",
                description:
                    "Katong Swimming Complex is one of the swimming pools located in the Central of Singapore. It is managed by Sport Singapore.\n\nKatong Swimming Pool is just 12 minutes walk from Mountbatten MRT station.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.88613712899185,
              lat: 1.3021925708996918,
            ),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "MOE Evans",
                imgName: "MOEEvans",
                direction: "21 Evans Road\nSingapore 259366",
                description:
                    "MOE Evans Swimming Complex is managed by Sport Singapore since 1990, the facilities are open to the public only outside the school's curriculum hours.\n\nFacility Information: 1 competition pool and 1 teaching pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.81956443737032,
              lat: 1.3183520917668439,
            ),
            SubLocation(
                color: AppColors.MAIN_COLOR,
                name: "Queenstown",
                imgName: "Queenstown",
                direction: "473 Stirling Road\nSingapore 148948",
                description:
                    "Queenstown Swimming Complex is a public swimming complex operated by Sport Singapore. Queenstown Sport Centre, formerly known as Queenstown Sport and Recreation Centre, continues to attract a group of regulars which consist of locals and expatriates alike.\nQueenstown operates one of the two diving pools managed by Sport Singapore, and it has a unique architecture which gives the guest an elevated view of its surrounding. Visitors to Queenstown will no doubt experience a sense of nostalgia, with many older Singaporeans sharing fond memories of this iconic location.\n\nQueenstown continue to serve its community while eagerly awaiting the next phase of development for a new chapter in its long heritage.\n\nFacility Information: 1 competition pool, 1 teaching pool, 1 wading pool and 1 diving pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.80275715763192,
              lat: 1.2971346458752762,
            ),
                SubLocation(
                color: Colors.purple,
                name: "Serangoon",
                imgName: "Serangoon",
                direction: "35-A Yio Chu Kang Road\nSingapore 545552",
                description:
                    "Serangoon Swimming Complex is one of the swimming pools located in the Central Region of Singapore. It is managed by Sport Singapore and has been serving the public with its amazing selection of swimming facilities maintained regularly.\n\nAlong with its enviable location within the Serangoon area, the swimming complex is certainly a popular spot for many of the residents within the vicinity.\n\nFacility Information: 1 competition pool, 1 wading pool",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
                  long: 103.87467500712056,
                  lat: 1.3572299236941352,
                ),
            SubLocation(
                color: AppColors.MAIN_COLOR,        
                name: "Toa Payoh",
                imgName: "ToaPayoh",
                direction: "301 Lorong 6 Toa Payoh\nSingapore 319392",
                description: "Toa Payoh Swimming Complex is a public swimming complex managed by Sport Singapore.\n\nFacility Information: 1 competition pool, 1 teaching pool and 1 wading pool.",
                icon: IconFontHelper.MORE_DOTS,
                subLocation: [],
              long: 103.85047012057107,
              lat: 1.3305698268606874,
            ),
          ]),
    ];
  }

}
