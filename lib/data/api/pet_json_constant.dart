const jsonString = '''
    {
  "pets": [
    {
      "id": "1",
      "name": "Buddy",
      "age": 2,
      "price": 100,
      "breed": "Golden Retriever",
      "imageUrl": [
        "https://heronscrossing.vet/wp-content/uploads/Golden-Retriever-1024x683.jpg",
        "https://images.ctfassets.net/m5ehn3s5t7ec/KtxCRW7y0LXNYcn6BHPPD/065b05bda2e516ea6a5887ce9856d1db/Golden_Retriever__Price.webp"
      ],
      "isAdopted": false
    },
    {
      "id": "2",
      "name": "Max",
      "age": 3,
      "price": 150,
      "breed": "German Shepherd",
      "imageUrl": [
        "https://www.bellaandduke.com/wp-content/uploads/2024/10/A-guide-to-German-Shepherds-characteristics-personality-lifespan-and-more-featured-image.webp",
        "https://cdn.britannica.com/79/232779-050-6B0411D7/German-Shepherd-dog-Alsatian.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "3",
      "name": "Bella",
      "age": 1,
      "price": 120,
      "breed": "Bulldog",
      "imageUrl": [
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Bulldog_inglese.jpg/800px-Bulldog_inglese.jpg",
        "https://cdn.britannica.com/07/234207-050-0037B589/English-bulldog-dog.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "4",
      "name": "Charlie",
      "age": 4,
      "price": 200,
      "breed": "Poodle",
      "imageUrl": [
        "https://puppiezo.com/wp-content/uploads/2023/06/IMG_1833.jpeg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS_IxLZ6rqgGwzD2TzVZfgnjqSmj8v5kyr8A&s"
      ],
      "isAdopted": false
    },
    {
      "id": "5",
      "name": "Lucy",
      "age": 2,
      "price": 90,
      "breed": "Beagle",
      "imageUrl": [
        "https://cdn.britannica.com/16/234216-050-C66F8665/beagle-hound-dog.jpg",
        "https://cdn.britannica.com/80/29280-050-A3A13277/Beagles-pets.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "6",
      "name": "Daisy",
      "age": 5,
      "price": 180,
      "breed": "Siberian Husky",
      "imageUrl": [
        "https://www.dailypaws.com/thmb/B6yWhzGpQZsg3kxMzLn-hvGIF7M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/siberian-husky-100800827-2000-9449ca147e0e4b819bce5189c2411188.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZxCC37SYP6aoMK02A8b09wlkqcSaEPwle2g&s"
      ],
      "isAdopted": false
    },
    {
      "id": "7",
      "name": "Rocky",
      "age": 3,
      "price": 130,
      "breed": "Boxer",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg2HjTWDvq4UCq4EAjn0fHhvU_NcZiQ-C20w&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcN4Y4heda3vR7NKGe5v1TaYEhxWbMocbpvA&s"
      ],
      "isAdopted": false
    },
    {
      "id": "8",
      "name": "Molly",
      "age": 2,
      "price": 110,
      "breed": "Dachshund",
      "imageUrl": [
        "https://i.redd.it/ty9oro089qfd1.jpeg",
        "https://cdn.britannica.com/13/234213-050-45F47984/dachshund-dog.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "9",
      "name": "Bailey",
      "age": 4,
      "price": 160,
      "breed": "Shih Tzu",
      "imageUrl": [
        "https://cdn.dotpe.in/longtail/store-items/7562157/aVNsRUAg.webp",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQptrYTLvIeVhys5wzkSHeNYW4cmRgD5teVYw&s"
      ],
      "isAdopted": false
    },
    {
      "id": "10",
      "name": "Lola",
      "age": 1,
      "price": 95,
      "breed": "Chihuahua",
      "imageUrl": [
        "https://apupabove.com/cdn/shop/articles/Chihuahua.jpg?v=1713957175&width=1600",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9GyVHdXk_yuXb_j7fD_05OdpBr7g0j4O2mA&s"
      ],
      "isAdopted": false
    },
    {
      "id": "11",
      "name": "Cooper",
      "age": 3,
      "price": 140,
      "breed": "Rottweiler",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoMhjj4DRoGE0oOQkDKSQwAKb3y7lvlPYH_g&s",
       
      ],
      "isAdopted": false
    },
    {
      "id": "12",
      "name": "Sadie",
      "age": 2,
      "price": 100,
      "breed": "Great Dane",
      "imageUrl": [
        "https://www.dogpackapp.com/blog/wp-content/uploads/2024/11/fawn-great-dane-standing-park.webp",
        "https://images.pexels.com/photos/532310/pexels-photo-532310.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
      ],
      "isAdopted": false
    },
    {
      "id": "13",
      "name": "Toby",
      "age": 4,
      "price": 170,
      "breed": "Pomeranian",
      "imageUrl": [
        "https://patmypets.com/wp-content/uploads/elementor/thumbs/Pomeranian-Pom-Dog-Breed-Information-Characteristics-Price-qk85w1ro5me8ayocfcc157ftvxdzvrjj0gqxp6igze.png",
        "https://cdn.britannica.com/41/233841-050-4FFECCF1/Pomeranian-dog.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "14",
      "name": "Zoe",
      "age": 1,
      "price": 85,
      "breed": "Yorkshire Terrier",
      "imageUrl": [
        "https://cdn.britannica.com/48/233848-050-C8254DF7/Yorkshire-Terrier-dog.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu5TcPlaRTZmNm3OBoXyUfpaeY0QZvtNxwkA&s"
      ],
      "isAdopted": false
    },
    {
      "id": "15",
      "name": "Duke",
      "age": 3,
      "price": 150,
      "breed": "Labrador Retriever",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNTsfwzD60R-EqaaLoaLKfz3fI9wt-RAJxOQ&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRglK42QUtGAEh0AX-E5TlZFiyRu5n4X73-FA&s"
      ],
      "isAdopted": false
    },
    {
      "id": "16",
      "name": "Luna",
      "age": 2,
      "price": 120,
      "breed": "French Bulldog",
      "imageUrl": [
        "https://cdn.britannica.com/44/233844-050-A0F9F39C/French-bulldog.jpg",
        "https://images2.minutemediacdn.com/image/upload/c_fill,w_1200,ar_4:3,f_auto,q_auto,g_auto/images/voltaxMediaLibrary/mmsport/mentalfloss/01gxxmbn1kfpvdnnd8bj.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "17",
      "name": "Jack",
      "age": 4,
      "price": 190,
      "breed": "Cocker Spaniel",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSohs_e6LeNXXOe48J_jbjgci70jNc46L94rw&s",
      ],
      "isAdopted": false
    },
    {
      "id": "18",
      "name": "Mia",
      "age": 1,
      "price": 90,
      "breed": "Pug",
      "imageUrl": [
        "https://dogtime.com/wp-content/uploads/sites/12/2011/01/GettyImages-sb10066858aa-001-e1693353192358.jpg",
      ],
      "isAdopted": false
    },
    {
      "id": "19",
      "name": "Bear",
      "age": 3,
      "price": 130,
      "breed": "Saint Bernard",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0LMNZ6jPx5DT7ts2e8KV1t1xuYszi-HNvXw&s",
        "https://cdn.britannica.com/69/235669-050-E70D097B/Saint-bernard-dog-st-bernard-head.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "20",
      "name": "Ruby",
      "age": 2,
      "price": 110,
      "breed": "Border Collie",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuCzGDLpLNCzoHmsoQyydxf_O52jazn56CdQ&s",

      ],
      "isAdopted": false
    },
    {
      "id": "21",
      "name": "Oscar",
      "age": 4,
      "price": 160,
      "breed": "Bull Terrier",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_KarjgeKSLB63wwoMeQouZXb9EBIhrX3lhw&s",
        "https://cdn.prod.website-files.com/651577594cea61d37cb19467/656f9355fb01568791cab1cf_Bull%20Terrier.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "22",
      "name": "Coco",
      "age": 1,
      "price": 95,
      "breed": "Maltese",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSznVBAaAqY7w-itHeiTKVxcZqiT-XQ-smLvg&s",
      ],
      "isAdopted": false
    },
    {
      "id": "23",
      "name": "Roxy",
      "age": 2,
      "price": 120,
      "breed": "Siamese Cat",
      "imageUrl": [
        "https://cdn-aahmh.nitrocdn.com/mwIJloVUffDtKiCgRcivopdgojcJrVwT/assets/images/optimized/rev-31cad3f/www.cozycatfurniture.com/image/siamese-cat-cover.jpg",
        "https://www.purina.co.uk/sites/default/files/styles/square_medium_440x440/public/2022-06/Siamese%201.jpg?h=c17eaee4&itok=BRsemy6v"
      ],
      "isAdopted": false
    },
    {
      "id": "24",
      "name": "Milo",
      "age": 3,
      "price": 140,
      "breed": "Persian Cat",
      "imageUrl": [
        "https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg",
        "https://petsworld.in/cdn/shop/articles/34_520x500_9b1aee52-f274-4d1b-be38-0e63c0c9e672.jpg?v=1734685299"
      ],
      "isAdopted": false
    },
    {
      "id": "25",
      "name": "Lily",
      "age": 1,
      "price": 80,
      "breed": "Bengal Cat",
      "imageUrl": [
        "https://www.petterati.com/cdn/shop/articles/Picture1_2a4f89bd-acb4-42e2-8350-e025fd0fceaf.jpg?v=1686805188",
        "https://www.shutterstock.com/image-photo/classical-persian-cat-cinnamon-ginger-600nw-2368104449.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "26",
      "name": "Blue",
      "age": 2,
      "price": 100,
      "breed": "Parrot",
      "imageUrl": [
        "https://static.toiimg.com/thumb/111907701/111907701.jpg?height=746&width=420&resizemode=76&imgsize=42634",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfaaWiBw7elEODYlj7JTOwYwQbhNNuEO0MMg&s"
      ],
      "isAdopted": false
    },
    {
      "id": "27",
      "name": "Sky",
      "age": 1,
      "price": 90,
      "breed": "Cockatiel",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb0YjKry50_ZLXilzTwYznA-LhouZMz3Nvsw&s",

      ],
      "isAdopted": false
    },
    {
      "id": "28",
      "name": "Snowball",
      "age": 2,
      "price": 110,
      "breed": "Rabbit",
      "imageUrl": [
        "https://example.com/snowball1.jpg",
        "https://example.com/snowball2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "29",
      "name": "Cotton",
      "age": 1,
      "price": 85,
      "breed": "Rabbit",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVA46zNCYKOEiMoCAwg9YAA079qOrosGp0BQ&s",
      ],
      "isAdopted": false
    },
    {
      "id": "30",
      "name": "Thumper",
      "age": 3,
      "price": 120,
      "breed": "Rabbit",
      "imageUrl": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhpwtQUAVk7bV9ZDHI3xS0s8s9MH7C8_RgoA&s",

      ],
      "isAdopted": false
    }
  ]
}
    ''';