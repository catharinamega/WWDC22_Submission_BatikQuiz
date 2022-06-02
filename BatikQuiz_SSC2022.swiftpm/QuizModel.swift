//
//  File.swift
//  BatikQuiz_SSC2022
//
//  Created by Catharina Adinda Mega Cahyani on 19/04/22.
//

import Foundation

//build a object that store many variables
struct QuizModel  {
    var img : String
    var ref: String
    var text : String
    var answer : [String]
    //store the correct answer
    var correct : String
    
}
 
//final quiz is an array of quizmodel
// this one is like dictionary, where the key is from the variables stored in QuizModel and fill the appropriate value
var myQuiz1 : [QuizModel] = [
 
    QuizModel(img: "mega-mendung",
              ref: "https://seragamomahlaweyan.com/",
    text: "Originated from Cirebon, West Java. It has cloud shape pattern where the cloud lines tend to be sharp, oval, and triangular. It has meaning of clouds that appear when the weather is cloudy.",
    answer: ["Batik Tujuh Rupa","Batik Awan","Batik Mega Mendung","Cloudy Batik"],
    correct: "Batik Mega Mendung"),
     
    QuizModel(img: "ceplok",
              ref: "https://knowyourbatik.wordpress.com/2017/10/03/",
              text: "Originated from Keraton Kotagede (Mataram), Yogyakarta. This batik pattern has symmetrical elements and forms a corner in four directions. Basically, it has repeated shapes such as images of rhombuses, flowers, and others. It has the meaning of gathering, which is the gathering of everything that is good, such as balance, order and balance for the people who use it.",
    answer: ["Batik Ceplok","Batik Keraton","Batik Simetris","Batik Tujuh Rupa"],
    correct: "Batik Ceplok"),
     
    QuizModel(img: "tujuh-rupa",
              ref:"https://www.orami.co.id/magazine/motif-batik",
    text: "Originated from Pekalongan,a coastal area in Central Java. It has blend of local culture with Chinese ethnicity. This pattern adopts the plant patterns on ceramics from China. The plant patterns are combined with a variety of animals. This batik contains the meaning of eloquence and softness.",
    answer: ["Batik Pesisir","Batik Tumbuhan","Batik Tujuh Rupa","Batik Mega Mendung"],
    correct: "Batik Tujuh Rupa"),
     
    QuizModel(img: "sogan",
              ref:"http://alonabatik.com/berita/detail",
    text: "This batik is identical to the Javanese palace areas (Keraton), namely Yogyakarta and Solo, the pattern follows the standard of the classical Keraton pattern. This batik coloring process uses natural dyes taken from the trunk of the Soga Tall tree. This batik is dominant in black and brown, or it can be a combination of the two colors.",
    answer: ["Batik Soga","Batik Sogan","Batik Ceplok","Batik Solo"],
    correct: "Batik Sogan"),
     
    QuizModel(img: "pring-sedapur",
              ref: "https://fasnina.com/batik-jawa/",
    text: "This batik is a typical batik of the Magetan region originating from Papringan Hamlet, Sidomukti Village, Plaosan District. The inspiration for this batik itself comes from the surrounding environment filled with bamboo trees. Therefore, the most prominent motif of this batik is the image of the bamboo clump. Its name when translated into Javanese means a clump of bamboo trees.",
    answer: ["Batik Pring Sedapur","Batik Bambu","Batik Sidomukti","Batik Papringan"],
    correct: "Batik Pring Sedapur"),

    
    QuizModel(img: "lasem",
              ref: " https://www.infobatik.com/",
    text: "Originated from Rembang, Central Java. It is believed to have mixed local culture and Chinese culture. This batik is often colored in red, typical of Chinese culture. It has four main motifs which are Hong bird, dragon, Mount Ringgit, and Watu Pecah. The image above has Mount Ringgit motif.",
    answer: ["Batik Ulam","Batik Lasem","Batik Hong","Batik Rembang"],
    correct: "Batik Lasem"),
    
    QuizModel(img: "ulamsari-mas",
              ref: "https://akurat.co/5-motif-batik-bali-yang-wajib-kamu-ketahui",
    text: "This batik is one of the decorative motifs of Balinese batik. This batik material is made of mori cloth which is different from batik motifs from other regions in Indonesia. This Balinese batik motif has fish and shrimp patterns that represent the livelihoods of the Balinese people, mostly as fishermen. It has meaning of welfare and prosperity of the people living in coastal areas.",
    answer: ["Batik Ikan and Udang","Batik Bali","Batik Mori","Batik Ulamsari Mas"],
    correct: "Batik Ulamsari Mas"),
    
    QuizModel(img: "jagatan-pisang",
              ref:"https://riverspace.org/motif-batik-bali/",
    text: "This batik is still one of the decorative motifs of Balinese batik. This Balinese batik motif is perfect for those of you who have a lover or partner. Why? Because this batik is often used as a gift to couples who are going to travel, in the hope that the couple will return safely.",
    answer: ["Batik Love","Batik Bali","Batik Mori","Batik Jagatan Pisang"],
    correct: "Batik Jagatan Pisang"),
    
    QuizModel(img: "singo-barong",
              ref: "https://budaya-indonesia.org/",
    text: "This batik is still one of the decorative motifs of Balinese batik. This Balinese batik motif is inspired by a mythical creature, namely the barong which is widely believed by Balinese people. This batik has meanings of miracle, power and might.",
    answer: ["Batik Singo","Batik Barong","Batik Singo Barong","Batik Bali"],
    correct: "Batik Singo Barong"),
    
    QuizModel(img: "parang-kusumo",
              ref: "https://museumnusantara.com/",
    text: "One of the oldest batik in Indonesia. This batik comes from Solo, but some sources say that it came from Yogyakarta. Literally, this batik comes from the word kusumo which in Javanese means flower, or in another meaning interpreted as nobility. This batik, which is famous for its mystical power, has a pattern like the letter 'S' which symbolizes an unbroken and always continuous connection. This means that we continue to strive for self-improvement, strive for prosperity and form close ties in the family.",
    answer: ["Batik Kusumo","Batik Parang Kusumo","Batik Solo Kusumo","Batik Yogyakarta"],
    correct: "Batik Parang Kusumo"),

]
 
//make a function to save the last score that user get
func SaveScore(quiz : String , score : Int){
    UserDefaults.standard.set(score, forKey: quiz)
}
 

func LoadScore (quiz : String) -> Int{
    return UserDefaults.standard.integer(forKey: quiz)
}
