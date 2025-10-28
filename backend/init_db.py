from app import app, db, User, Vendor, Favorite
from datetime import datetime

def init_sample_data():
    with app.app_context():
        # Clear existing data
        db.drop_all()
        db.create_all()
        
        print("Creating sample data...")
        
        # Sample users
        user1 = User(
            name="John Doe",
            username="johndoe",
            email="john@duke.edu",
            password_hash="hashed_password_123"
        )
        user2 = User(
            name="Jane Smith",
            username="janesmith",
            email="jane@duke.edu",
            password_hash="hashed_password_456",
            is_admin=True
        )
        
        # Sample vendors
        vendor1 = Vendor(
            name="The Skillet",
            contact_info="(919) 123-4567",
            location_category="on-campus",
            address="Bryan Center, Duke University",
            operating_hours="Mon-Fri: 7AM-10PM, Sat-Sun: 8AM-9PM",
            cuisine_type="American, Comfort Food",
            payment_methods="DukeFlex, Credit Card, Mobile Payment",
            dietary_tags="Vegetarian, Gluten-Free Options"
        )
        vendor2 = Vendor(
            name="Sazon Latin Street Food",
            contact_info="(919) 987-6543",
            location_category="off-campus",
            address="2504 University Dr, Durham, NC 27707",
            operating_hours="Mon-Sat: 11AM-9PM, Sun: 12PM-8PM",
            cuisine_type="Latin American, Mexican",
            payment_methods="Credit Card, Cash, Mobile Payment",
            dietary_tags="Vegetarian, Vegan Options"
        )
        vendor3 = Vendor(
            name="Cafe",
            contact_info="(919) 555-0123",
            location_category="on-campus",
            address="Perkins Library, Duke University",
            operating_hours="Mon-Thu: 8AM-10PM, Fri: 8AM-8PM, Sat-Sun: 10AM-6PM",
            cuisine_type="Coffee, Sandwiches, Pastries",
            payment_methods="DukeFlex, Credit Card",
            dietary_tags="Vegetarian, Vegan, Gluten-Free"
        )
        
        # Add to session
        db.session.add_all([user1, user2, vendor1, vendor2, vendor3])
        db.session.commit()
        
        # Sample favorites
        favorite1 = Favorite(user_id=1, vendor_id=1)
        favorite2 = Favorite(user_id=1, vendor_id=2)
        favorite3 = Favorite(user_id=1, vendor_id=3)
        favorite4 = Favorite(user_id=2, vendor_id=1)
        
        db.session.add_all([favorite1, favorite2, favorite3, favorite4])
        db.session.commit()
        
        print("Sample data created successfully!")
        print("Users: John Doe (id:1), Jane Smith (id:2)")
        print("Vendors: The Skillet, Sazon Latin Street Food, Cafe")
        print("Favorites: User 1 has 3 favorites, User 2 has 1 favorite")

if __name__ == '__main__':
    init_sample_data()