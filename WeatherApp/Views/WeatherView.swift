import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment:.leading, spacing: 5){
                    Text(weather.name).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
              
              VStack{
                  HStack{
                      VStack(spacing:20){
                          Image(systemName: "sun.max")
                              .font(.system(size: 40))

                          
                          Text(weather.weather[0].main)
                          
                      }.frame(width: 80, alignment: .leading)
                      
                      Text(weather.main.feelsLike
                        .round() + "°")
                      .font(.system(size: 100))
                      .bold()
                      .padding()
                  }
                  
                  Spacer().frame(width: 80)
                  
                  AsyncImage(url: URL(string: "https://pixabay.com/photos/sunset-nature-city-twilight-8170058/")){image in image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width:350)
                  }placeholder: {
                      ProgressView()
                  }
                  
                  Spacer()
                  
              }
              .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ )
            }.padding()
             .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
             
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.686, saturation: 0.868, brightness: 0.312))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
