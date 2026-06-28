package Profile;

public class Profile {
 
    private int studID;
    private String name;
    private String email;
    private String program;
    private String hobbies;
    private String bio;
    private String picture;

    // Default Constructor
    public Profile() {}

    // Normal Constructor
    public Profile(int studID, String name, String email, String program, String hobbies, String bio, String picture) {
        this.studID = studID;
        this.name = name;
        this.email = email;
        this.program = program;
        this.hobbies = hobbies;
        this.bio = bio;
        this.picture = picture;
    }

    // Getters and Setters
    public int getStudID() { return studID; }
    public void setStudID(int studID) { this.studID = studID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }

    public String getHobbies() { return hobbies; }
    public void setHobbies(String hobbies) { this.hobbies = hobbies; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }
    
    public String getPicture() { return picture; }
    public void setPicture(String picture) { this.picture = picture; }
}