//
//  FirstViewController.swift
//  Clico
//
//  Created by Mohamed on 09/08/2016.
//  Copyright © 2016 HACHFI. All rights reserved.
//

import UIKit
import WWCalendarTimeSelector

class FirstViewController: ParentViewController, MPGTextFieldDelegate, WWCalendarTimeSelectorProtocol, DealsRangeTableViewControllerDelegate {

    var selectedStartDate = Date()
    var selectedEndDate = Date()
    
    
    @IBOutlet weak var activityLabel: MPGTextField_Swift!
    
    @IBOutlet weak var locationLabel: MPGTextField_Swift!
    
    @IBOutlet weak var dealRangeLabel: UILabel!
    
    @IBOutlet weak var locationUnderline: UIView!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchImage: UIImageView!
    
    @IBOutlet weak var searchUnderline: UIView!
    @IBOutlet weak var locationImage: UIImageView!
    
    var isShareView : Bool{
        return navigationController?.title == "Share"
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityLabel.mDelegate = self
        activityLabel.attributedPlaceholder = NSAttributedString(string:activityLabel.placeholder!,
                                                               attributes:[NSForegroundColorAttributeName: UIColor.black])

        locationLabel.mDelegate = self
        locationLabel.attributedPlaceholder = NSAttributedString(string:locationLabel.placeholder!,
                                                                 attributes:[NSForegroundColorAttributeName: UIColor.black])
        searchImage.image = searchImage.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        locationImage.image = locationImage.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        setupTabBar()
    }
    
    func setupTabBar() {
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray], for:UIControlState())
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.yellow], for:.selected)
//        let image : UIImage = tabBarItem.image!
//        tabBarItem.image =
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isShareView {
            searchButton.setTitle( ProfileState.sharedState.isTrader ? "SHARE DEAL" :"SHARE REQUEST", for: UIControlState() )
            
            backgroundImageView.image = UIImage(named: ProfileState.sharedState.isTrader ? "blurred_resto" : "blurred_clients")
        }
        else {
            searchButton.setTitle( ProfileState.sharedState.isTrader ? "FIND CLIENT" :"SEARCH", for: UIControlState() )
            backgroundImageView.image = UIImage(named: ProfileState.sharedState.isTrader ? "blurred_clients" : "blurred_resto")
        }
    }
    
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, dates: [Date]) {
        selectedStartDate = dates.min(by: { d1, d2 -> Bool in
            return d1.compare(d2) == ComparisonResult.orderedAscending
        }) ?? Date()
        startDateLabel.text = selectedStartDate.string(with: "dd/MM/yyyy")
        startDateLabel.textColor = UIColor.white
        selectedEndDate = dates.max(by: { d1, d2 -> Bool in
            return d1.compare(d2) == ComparisonResult.orderedAscending
        }) ?? Date()
        endDateLabel.text = selectedEndDate.string(with: "dd/MM/yyyy")
        endDateLabel.textColor = UIColor.white
    }
    
    @IBAction func selectStartDate(_ sender: AnyObject) {
        selectDates()
    }
    
    @IBAction func selectEndDate(_ sender: AnyObject) {
        selectDates()
    }
    
    func selectDates() {
        let selector = WWCalendarTimeSelector.instantiate()
        selector.update(UIColor.Pink.Medium)
        selector.delegate = self
        selector.optionSelectionType = .range
        selector.optionCurrentDateRange.setStartDate(selectedStartDate)
        selector.optionCurrentDateRange.setEndDate(selectedEndDate)
        self.parent?.parent?.present(selector, animated: true, completion: nil)
    }
    
    @IBAction func selectDealRate(_ sender: AnyObject) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDealsRangeTableViewController" {
            let dealsRangeTableViewController = segue.destination as! DealsRangeTableViewController
            dealsRangeTableViewController.delegate = self
        }
    }
    func dealsRangeTableViewController(_ dealsRangeTableViewController: DealsRangeTableViewController, didSelect range: Int) {
        dealRangeLabel.text = "\(range)%"
    }
    
//    func textFieldDidEndEditing(textField: MPGTextField_Swift, withSelection data: Dictionary<String,AnyObject>){
//        if textField == activityLabel {
//            searchUnderline.backgroundColor = UIColor.redColor()
//        } else {
//            locationUnderline.backgroundColor = UIColor.redColor()
//        }
//        
//    }
//    
//    func textFieldShouldSelect(textField: MPGTextField_Swift) -> Bool {
//        if textField == activityLabel {
//            searchUnderline.backgroundColor = UIColor.greenColor()
//        } else {
//            locationUnderline.backgroundColor = UIColor.greenColor()
//        }
//        return true
//    }

    
    func dataForPopoverInTextField(_ textfield: MPGTextField_Swift) -> [Dictionary<String, AnyObject>] {
        
        if textfield == activityLabel {
            return [["DisplayText" : "Restaurant" as AnyObject],
                    ["DisplayText" : "Restaurant idien" as AnyObject],
                    ["DisplayText" : "Restaurant jap" as AnyObject],
                    ["DisplayText" : "Hotel" as AnyObject],
                    ["DisplayText" : "Medecin" as AnyObject],
                    ["DisplayText" : "Plombier" as AnyObject]]
        }
        
        
        return [
            ["DisplayText" : "Paris" as AnyObject],
            ["DisplayText" : "Marseille" as AnyObject],
            ["DisplayText" : "Lyon" as AnyObject],
            ["DisplayText" : "Toulouse" as AnyObject],
            ["DisplayText" : "Nice" as AnyObject],
            ["DisplayText" : "Nantes" as AnyObject],
            ["DisplayText" : "Strasbourg" as AnyObject],
            ["DisplayText" : "Montpellier" as AnyObject],
            ["DisplayText" : "Bordeaux" as AnyObject],
            ["DisplayText" : "Lille13" as AnyObject],
            ["DisplayText" : "Rennes" as AnyObject],
            ["DisplayText" : "Reims" as AnyObject],
            ["DisplayText" : "Le Havre" as AnyObject],
            ["DisplayText" : "Saint-Étienne" as AnyObject],
            ["DisplayText" : "Toulon" as AnyObject],
            ["DisplayText" : "Grenoble" as AnyObject],
            ["DisplayText" : "Dijon" as AnyObject],
            ["DisplayText" : "Nîmes" as AnyObject],
            ["DisplayText" : "Angers" as AnyObject],
            ["DisplayText" : "Villeurbanne" as AnyObject],
            ["DisplayText" : "Le Mans" as AnyObject],
            ["DisplayText" : "Saint-Denis" as AnyObject],
            ["DisplayText" : "Aix-en-Provence" as AnyObject],
            ["DisplayText" : "Clermont-Ferrand" as AnyObject],
            ["DisplayText" : "Brest" as AnyObject],
            ["DisplayText" : "Limoges" as AnyObject],
            ["DisplayText" : "Tours" as AnyObject],
            ["DisplayText" : "Amiens" as AnyObject],
            ["DisplayText" : "Perpignan" as AnyObject],
            ["DisplayText" : "Metz" as AnyObject],
            ["DisplayText" : "Besançon" as AnyObject],
            ["DisplayText" : "Boulogne-Billancourt" as AnyObject],
            ["DisplayText" : "Orléans" as AnyObject],
            ["DisplayText" : "Mulhouse" as AnyObject],
            ["DisplayText" : "Rouen" as AnyObject],
            ["DisplayText" : "Saint-Denis" as AnyObject],
            ["DisplayText" : "Caen" as AnyObject],
            ["DisplayText" : "Argenteuil" as AnyObject],
            ["DisplayText" : "Saint-Paul" as AnyObject],
            ["DisplayText" : "Montreuil" as AnyObject],
            ["DisplayText" : "Nancy" as AnyObject],
            ["DisplayText" : "Nouméa14" as AnyObject],
            ["DisplayText" : "Roubaix" as AnyObject],
            ["DisplayText" : "Tourcoing" as AnyObject],
            ["DisplayText" : "Nanterre" as AnyObject],
            ["DisplayText" : "Avignon" as AnyObject],
            ["DisplayText" : "Vitry-sur-Seine" as AnyObject],
            ["DisplayText" : "Créteil" as AnyObject],
            ["DisplayText" : "Dunkerque15" as AnyObject],
            ["DisplayText" : "Poitiers" as AnyObject],
            ["DisplayText" : "Asnières-sur-Seine" as AnyObject],
            ["DisplayText" : "Courbevoie" as AnyObject],
            ["DisplayText" : "Versailles" as AnyObject],
            ["DisplayText" : "Colombes" as AnyObject],
            ["DisplayText" : "Fort-de-France" as AnyObject],
            ["DisplayText" : "Aulnay-sous-Bois" as AnyObject],
            ["DisplayText" : "Saint-Pierre" as AnyObject],
            ["DisplayText" : "Cherbourg-en-Cotentin16" as AnyObject],
            ["DisplayText" : "Rueil-Malmaison" as AnyObject],
            ["DisplayText" : "Pau" as AnyObject],
            ["DisplayText" : "Aubervilliers" as AnyObject],
            ["DisplayText" : "Le Tampon" as AnyObject],
            ["DisplayText" : "Champigny-sur-Marne" as AnyObject],
            ["DisplayText" : "Antibes" as AnyObject],
            ["DisplayText" : "Béziers" as AnyObject],
            ["DisplayText" : "La Rochelle" as AnyObject],
            ["DisplayText" : "Saint-Maur-des-Fossés" as AnyObject],
            ["DisplayText" : "Cannes" as AnyObject],
            ["DisplayText" : "Calais" as AnyObject],
            ["DisplayText" : "Saint-Nazaire" as AnyObject],
            ["DisplayText" : "Mérignac" as AnyObject],
            ["DisplayText" : "Drancy" as AnyObject],
            ["DisplayText" : "Colmar" as AnyObject],
            ["DisplayText" : "Ajaccio" as AnyObject],
            ["DisplayText" : "Bourges" as AnyObject],
            ["DisplayText" : "Issy-les-Moulineaux" as AnyObject],
            ["DisplayText" : "Levallois-Perret" as AnyObject],
            ["DisplayText" : "La Seyne-sur-Mer" as AnyObject],
            ["DisplayText" : "Quimper" as AnyObject],
            ["DisplayText" : "Noisy-le-Grand" as AnyObject],
            ["DisplayText" : "Villeneuve-d'Ascq" as AnyObject],
            ["DisplayText" : "Neuilly-sur-Seine" as AnyObject],
            ["DisplayText" : "Valence" as AnyObject],
            ["DisplayText" : "Antony" as AnyObject],
            ["DisplayText" : "Cergy" as AnyObject],
            ["DisplayText" : "Vénissieux" as AnyObject],
            ["DisplayText" : "Pessac" as AnyObject],
            ["DisplayText" : "Troyes" as AnyObject],
            ["DisplayText" : "Clichy" as AnyObject],
            ["DisplayText" : "Ivry-sur-Seine" as AnyObject],
            ["DisplayText" : "Chambéry" as AnyObject],
            ["DisplayText" : "Lorient" as AnyObject],
            ["DisplayText" : "Les Abymes" as AnyObject],
            ["DisplayText" : "Montauban" as AnyObject],
            ["DisplayText" : "Sarcelles" as AnyObject],
            ["DisplayText" : "Niort" as AnyObject],
            ["DisplayText" : "Mamoudzou" as AnyObject],
            ["DisplayText" : "Villejuif" as AnyObject],
            ["DisplayText" : "Saint-André" as AnyObject],
            ["DisplayText" : "Hyères" as AnyObject],
            ["DisplayText" : "Saint-Quentin" as AnyObject],
            ["DisplayText" : "Beauvais" as AnyObject],
            ["DisplayText" : "Épinay-sur-Seine" as AnyObject],
            ["DisplayText" : "Cayenne" as AnyObject],
            ["DisplayText" : "Maisons-Alfort" as AnyObject],
            ["DisplayText" : "Cholet" as AnyObject],
            ["DisplayText" : "Meaux" as AnyObject],
            ["DisplayText" : "Chelles" as AnyObject],
            ["DisplayText" : "Pantin" as AnyObject],
            ["DisplayText" : "Évry" as AnyObject],
            ["DisplayText" : "Fontenay-sous-Bois" as AnyObject],
            ["DisplayText" : "Fréjus" as AnyObject],
            ["DisplayText" : "Vannes" as AnyObject],
            ["DisplayText" : "Bondy" as AnyObject],
            ["DisplayText" : "Narbonne" as AnyObject],
            ["DisplayText" : "Le Blanc-Mesnil" as AnyObject],
            ["DisplayText" : "La Roche-sur-Yon" as AnyObject],
            ["DisplayText" : "Saint-Louis" as AnyObject],
            ["DisplayText" : "Arles" as AnyObject],
            ["DisplayText" : "Clamart" as AnyObject],
            ["DisplayText" : "Annecy" as AnyObject],
            ["DisplayText" : "Sartrouville" as AnyObject],
            ["DisplayText" : "Grasse" as AnyObject],
            ["DisplayText" : "Laval" as AnyObject],
            ["DisplayText" : "Belfort" as AnyObject],
            ["DisplayText" : "Bobigny" as AnyObject],
            ["DisplayText" : "Évreux" as AnyObject],
            ["DisplayText" : "Vincennes" as AnyObject],
            ["DisplayText" : "Montrouge" as AnyObject],
            ["DisplayText" : "Sevran" as AnyObject],
            ["DisplayText" : "Albi" as AnyObject],
            ["DisplayText" : "Charleville-Mézières" as AnyObject],
            ["DisplayText" : "Suresnes" as AnyObject],
            ["DisplayText" : "Martigues" as AnyObject],
            ["DisplayText" : "Corbeil-Essonnes" as AnyObject],
            ["DisplayText" : "Saint-Ouen" as AnyObject],
            ["DisplayText" : "Bayonne" as AnyObject],
            ["DisplayText" : "Cagnes-sur-Mer" as AnyObject],
            ["DisplayText" : "Brive-la-Gaillarde" as AnyObject],
            ["DisplayText" : "Carcassonne" as AnyObject],
            ["DisplayText" : "Massy" as AnyObject],
            ["DisplayText" : "Blois" as AnyObject],
            ["DisplayText" : "Saint-Brieuc" as AnyObject],
            ["DisplayText" : "Aubagne" as AnyObject],
            ["DisplayText" : "Châteauroux" as AnyObject],
            ["DisplayText" : "Chalon-sur-Saône" as AnyObject],
            ["DisplayText" : "Mantes-la-Jolie" as AnyObject],
            ["DisplayText" : "Meudon" as AnyObject],
            ["DisplayText" : "Saint-Malo" as AnyObject],
            ["DisplayText" : "Châlons-en-Champagne" as AnyObject],
            ["DisplayText" : "Alfortville" as AnyObject],
            ["DisplayText" : "Sète" as AnyObject],
            ["DisplayText" : "Salon-de-Provence" as AnyObject],
            ["DisplayText" : "Vaulx-en-Velin" as AnyObject],
            ["DisplayText" : "Puteaux" as AnyObject],
            ["DisplayText" : "Rosny-sous-Bois" as AnyObject],
            ["DisplayText" : "Saint-Herblain" as AnyObject],
            ["DisplayText" : "Gennevilliers" as AnyObject],
            ["DisplayText" : "Le Cannet" as AnyObject],
            ["DisplayText" : "Livry-Gargan" as AnyObject],
            ["DisplayText" : "Saint-Priest" as AnyObject],
            ["DisplayText" : "Istres" as AnyObject],
            ["DisplayText" : "Valenciennes" as AnyObject],
            ["DisplayText" : "Choisy-le-Roi" as AnyObject],
            ["DisplayText" : "Caluire-et-Cuire" as AnyObject],
            ["DisplayText" : "Boulogne-sur-Mer" as AnyObject],
            ["DisplayText" : "Bastia" as AnyObject],
            ["DisplayText" : "Angoulême" as AnyObject],
            ["DisplayText" : "Garges-lès-Gonesse" as AnyObject],
            ["DisplayText" : "Castres" as AnyObject],
            ["DisplayText" : "Thionville" as AnyObject],
            ["DisplayText" : "Wattrelos" as AnyObject],
            ["DisplayText" : "Talence" as AnyObject],
            ["DisplayText" : "Saint-Laurent-du-Maroni" as AnyObject],
            ["DisplayText" : "Douai" as AnyObject],
            ["DisplayText" : "Noisy-le-Sec" as AnyObject],
            ["DisplayText" : "Tarbes" as AnyObject],
            ["DisplayText" : "Arras" as AnyObject],
            ["DisplayText" : "Alès" as AnyObject],
            ["DisplayText" : "La Courneuve" as AnyObject],
            ["DisplayText" : "Bourg-en-Bresse" as AnyObject],
            ["DisplayText" : "Compiègne" as AnyObject],
            ["DisplayText" : "Gap" as AnyObject],
            ["DisplayText" : "Melun" as AnyObject],
            ["DisplayText" : "Le Lamentin" as AnyObject],
            ["DisplayText" : "Rezé" as AnyObject],
            ["DisplayText" : "Saint-Germain-en-Laye" as AnyObject],
            ["DisplayText" : "Marcq-en-Barœul" as AnyObject],
            ["DisplayText" : "Gagny" as AnyObject],
            ["DisplayText" : "Anglet" as AnyObject],
            ["DisplayText" : "Draguignan" as AnyObject],
            ["DisplayText" : "Chartres" as AnyObject],
            ["DisplayText" : "Bron" as AnyObject],
            ["DisplayText" : "Bagneux" as AnyObject],
            ["DisplayText" : "Colomiers" as AnyObject],
            ["DisplayText" : "Saint-Martin-d'Hères" as AnyObject],
            ["DisplayText" : "Pontault-Combault" as AnyObject],
            ["DisplayText" : "Montluçon" as AnyObject],
            ["DisplayText" : "Joué-lès-Tours" as AnyObject],
            ["DisplayText" : "Saint-Joseph" as AnyObject],
            ["DisplayText" : "Poissy" as AnyObject],
            ["DisplayText" : "Savigny-sur-Orge" as AnyObject],
            ["DisplayText" : "Montélimar" as AnyObject],
            ["DisplayText" : "Villefranche-sur-Saône" as AnyObject],
            ["DisplayText" : "Stains" as AnyObject],
            ["DisplayText" : "Saint-Benoît" as AnyObject],
            ["DisplayText" : "Bagnolet" as AnyObject],
            ["DisplayText" : "Châtillon" as AnyObject],
            ["DisplayText" : "Le Port" as AnyObject],
            ["DisplayText" : "Sainte-Geneviève-des-Bois" as AnyObject],
            ["DisplayText" : "Saint-Martin" as AnyObject],
            ["DisplayText" : "Échirolles" as AnyObject],
            ["DisplayText" : "Roanne" as AnyObject],
            ["DisplayText" : "Villepinte" as AnyObject],
            ["DisplayText" : "Saint-Chamond" as AnyObject],
            ["DisplayText" : "Conflans-Sainte-Honorine" as AnyObject],
            ["DisplayText" : "Auxerre" as AnyObject],
            ["DisplayText" : "Nevers" as AnyObject],
            ["DisplayText" : "Neuilly-sur-Marne" as AnyObject],
            ["DisplayText" : "La Ciotat" as AnyObject],
            ["DisplayText" : "Tremblay-en-France" as AnyObject],
            ["DisplayText" : "Thonon-les-Bains" as AnyObject],
            ["DisplayText" : "Vitrolles" as AnyObject],
            ["DisplayText" : "Haguenau" as AnyObject],
            ["DisplayText" : "Six-Fours-les-Plages" as AnyObject],
            ["DisplayText" : "Agen" as AnyObject],
            ["DisplayText" : "Creil" as AnyObject],
            ["DisplayText" : "Annemasse" as AnyObject],
            ["DisplayText" : "Saint-Raphaël" as AnyObject],
            ["DisplayText" : "Marignane" as AnyObject],
            ["DisplayText" : "Romans-sur-Isère" as AnyObject],
            ["DisplayText" : "Montigny-le-Bretonneux" as AnyObject],
            ["DisplayText" : "Le Perreux-sur-Marne" as AnyObject],
            ["DisplayText" : "Franconville" as AnyObject],
            ["DisplayText" : "Mâcon" as AnyObject],
            ["DisplayText" : "Saint-Leu" as AnyObject],
            ["DisplayText" : "Cambrai" as AnyObject],
            ["DisplayText" : "Châtenay-Malabry" as AnyObject],
            ["DisplayText" : "Sainte-Marie" as AnyObject],
            ["DisplayText" : "Villeneuve-Saint-Georges" as AnyObject],
            ["DisplayText" : "Houilles" as AnyObject],
            ["DisplayText" : "Épinal" as AnyObject],
            ["DisplayText" : "Dumbéa17" as AnyObject],
            ["DisplayText" : "Lens" as AnyObject],
            ["DisplayText" : "Liévin" as AnyObject],
            ["DisplayText" : "Les Mureaux" as AnyObject],
            ["DisplayText" : "Schiltigheim" as AnyObject],
            ["DisplayText" : "La Possession" as AnyObject],
            ["DisplayText" : "Meyzieu" as AnyObject],
            ["DisplayText" : "Dreux" as AnyObject],
            ["DisplayText" : "Nogent-sur-Marne" as AnyObject],
            ["DisplayText" : "Plaisir" as AnyObject],
            ["DisplayText" : "Mont-de-Marsan" as AnyObject],
            ["DisplayText" : "Palaiseau" as AnyObject],
            ["DisplayText" : "Châtellerault" as AnyObject],
            ["DisplayText" : "Goussainville" as AnyObject],
            ["DisplayText" : "L'Haÿ-les-Roses" as AnyObject],
            ["DisplayText" : "Viry-Châtillon" as AnyObject],
            ["DisplayText" : "Vigneux-sur-Seine" as AnyObject],
            ["DisplayText" : "Trappes" as AnyObject],
            ["DisplayText" : "Chatou" as AnyObject],
            ["DisplayText" : "Clichy-sous-Bois" as AnyObject],
            ["DisplayText" : "Villenave-d'Ornon" as AnyObject],
            ["DisplayText" : "Rillieux-la-Pape" as AnyObject],
            ["DisplayText" : "Maubeuge" as AnyObject],
            ["DisplayText" : "Charenton-le-Pont" as AnyObject],
            ["DisplayText" : "Malakoff" as AnyObject],
            ["DisplayText" : "Matoury" as AnyObject],
            ["DisplayText" : "Dieppe" as AnyObject],
            ["DisplayText" : "Athis-Mons" as AnyObject],
            ["DisplayText" : "Savigny-le-Temple" as AnyObject],
            ["DisplayText" : "Périgueux" as AnyObject],
            ["DisplayText" : "Baie-Mahault" as AnyObject],
        ]
        
    }

}

extension WWCalendarTimeSelector {
    func update(_ calendarColor : UIColor) {
        optionCalendarBackgroundColorTodayHighlight = calendarColor
        optionCalendarBackgroundColorPastDatesHighlight = calendarColor
        optionCalendarBackgroundColorFutureDatesHighlight = calendarColor
        optionClockBackgroundColorAMPMHighlight = calendarColor
        optionClockBackgroundColorHourHighlight = calendarColor
        optionClockBackgroundColorHourHighlightNeedle = calendarColor
        optionClockBackgroundColorMinuteHighlight = calendarColor
        optionClockBackgroundColorMinuteHighlightNeedle = calendarColor
        optionButtonFontColorCancel = calendarColor
        optionButtonFontColorDone = calendarColor
        optionButtonFontColorCancelHighlight = calendarColor.withAlphaComponent(0.25)
        optionButtonFontColorDoneHighlight = calendarColor.withAlphaComponent(0.25)
        optionTopPanelBackgroundColor = calendarColor
        optionSelectorPanelBackgroundColor = calendarColor.withAlphaComponent(0.9)
    }
    
}

extension Date {
    func string(with format : String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format as String
        
        return formatter.string(from: self)
    }
}
