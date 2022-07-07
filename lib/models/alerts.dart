class CovidAlert {
  static int numAlerts = 0;

  static void createAlert() => numAlerts++;

  static Map<String, dynamic> toJson() {
    return {"alerts": numAlerts};
  }

  static fromJson(Map<String, dynamic> json) {
    return numAlerts = json["alerts"];
  }
}
